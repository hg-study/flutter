# Flutter 인증 앱 개발 - 단계별 작업 가이드

##  목차
- [사전 준비](#사전-준비)
- [1단계: 프로젝트 설정 및 패키지 설치](#1단계-프로젝트-설정-및-패키지-설치)
- [2단계: API 서비스 기본 클래스 생성](#2단계-api-서비스-기본-클래스-생성)
- [3단계: 인증 서비스 구현](#3단계-인증-서비스-구현)
- [4단계: 로그인 화면 구현](#4단계-로그인-화면-구현)
- [5단계: 회원가입 화면 구현](#5단계-회원가입-화면-구현)
- [6단계: 홈 화면 구현](#6단계-홈-화면-구현)
- [7단계: 라우팅 및 초기 화면 설정](#7단계-라우팅-및-초기-화면-설정)
- [8단계: 테스트 및 확인](#8단계-테스트-및-확인)

---

## 사전 준비

### 필수 조건
-  Flutter SDK 설치 완료
-  백엔드 서버(F04AuthBn) 실행 중 (포트 8090)
-  MySQL 데이터베이스 실행 중
-  Redis 서버 실행 중

### 백엔드 확인 사항
백엔드 서버가 정상적으로 실행되고 있는지 확인:
- 브라우저에서 `http://localhost:8090` 접속 테스트
- 또는 `http://localhost:8090/validate` 엔드포인트 확인

---

## 1단계: 프로젝트 설정 및 패키지 설치

###  목표
Flutter 프로젝트에 필요한 패키지를 설치하고 프로젝트 구조를 준비합니다.

###  작업 내용

#### 1.1 pubspec.yaml 파일 수정

`F04AuthApp/pubspec.yaml` 파일을 열고 `dependencies` 섹션에 다음 패키지를 추가합니다:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  
  # HTTP 통신을 위한 패키지
  http: ^1.1.0
  dio: ^5.4.0
  
  # 쿠키 관리를 위한 패키지
  cookie_jar: ^4.0.8
  dio_cookie_manager: ^3.0.0
  
  # 로컬 저장소를 위한 패키지
  shared_preferences: ^2.2.2
```

#### 1.2 패키지 설치

터미널에서 다음 명령어를 실행합니다:

```bash
cd F04AuthApp
flutter pub get
```

#### 1.3 디렉토리 구조 생성

`lib` 폴더 안에 다음 디렉토리를 생성합니다:

```
lib/
├── services/      # API 서비스 클래스
├── screens/       # 화면 위젯
└── main.dart      # 앱 진입점
```

**작업 방법:**
- `lib` 폴더 우클릭 → New → Directory
- `services` 폴더 생성
- `screens` 폴더 생성

###  확인 사항
- [ ] `pubspec.yaml`에 모든 패키지가 추가되었는지 확인
- [ ] `flutter pub get` 실행 후 에러가 없는지 확인
- [ ] `lib/services`와 `lib/screens` 폴더가 생성되었는지 확인

---

## 2단계: API 서비스 기본 클래스 생성

###  목표
백엔드 서버와 통신하기 위한 기본 API 서비스 클래스를 생성합니다.

###  작업 내용

#### 2.1 ApiService 클래스 생성

`lib/services/api_service.dart` 파일을 생성하고 다음 코드를 작성합니다:

```dart
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class ApiService {
  // 백엔드 서버 주소
  static const String baseUrl = 'http://localhost:8090';
  
  // Dio 인스턴스와 쿠키 관리자
  late Dio _dio;
  late CookieJar _cookieJar;

  // 생성자
  ApiService() {
    // 쿠키 저장소 초기화
    _cookieJar = CookieJar();
    
    // Dio 인스턴스 초기화
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    
    // 쿠키 관리자 추가 (자동으로 쿠키 저장/전송)
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  // Dio 인스턴스를 외부에서 사용할 수 있도록 getter 제공
  Dio get dio => _dio;
}
```

###  설명
- **Dio**: HTTP 클라이언트 라이브러리
- **CookieJar**: 쿠키를 저장하고 관리하는 클래스
- **CookieManager**: Dio 인터셉터로 쿠키를 자동으로 처리
- **baseUrl**: 백엔드 서버 주소 (포트 8090)

###  확인 사항
- [ ] `lib/services/api_service.dart` 파일이 생성되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인 (빨간 줄이 없는지 확인)
- [ ] `flutter pub get`로 패키지가 제대로 설치되었는지 확인

---

## 3단계: 인증 서비스 구현

###  목표
로그인, 회원가입, 로그아웃 등 인증 관련 기능을 처리하는 서비스 클래스를 구현합니다.

###  작업 내용

#### 3.1 AuthService 클래스 생성

`lib/services/auth_service.dart` 파일을 생성하고 다음 코드를 작성합니다:

```dart
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';

class AuthService {
  final ApiService _apiService = ApiService();
  
  // SharedPreferences에 저장할 키 이름
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _usernameKey = 'username';

  // 회원가입
  Future<Map<String, dynamic>> join({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _apiService.dio.post(
        '/join',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': '회원가입 성공'};
      }
      return {'success': false, 'message': '회원가입 실패'};
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['message'] ?? '회원가입 중 오류 발생'
      };
    }
  }

  // 로그인
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _apiService.dio.post(
        '/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // 로그인 성공 시 로컬 저장소에 상태 저장
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_isLoggedInKey, true);
        await prefs.setString(_usernameKey, username);

        return {
          'success': true,
          'message': response.data['message'] ?? '로그인 성공',
        };
      }
      return {'success': false, 'message': '로그인 실패'};
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['message'] ?? '로그인 중 오류 발생'
      };
    }
  }

  // 로그아웃
  Future<void> logout() async {
    try {
      // 백엔드에 로그아웃 요청
      await _apiService.dio.post('/logout');
    } catch (e) {
      // 로그아웃 실패해도 로컬 상태는 삭제
    } finally {
      // 로컬 저장소에서 로그인 정보 삭제
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_isLoggedInKey);
      await prefs.remove(_usernameKey);
    }
  }

  // 토큰 유효성 검증
  Future<bool> validateToken() async {
    try {
      final response = await _apiService.dio.get('/validate');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // 사용자 정보 조회
  Future<Map<String, dynamic>?> getUserInfo() async {
    try {
      final response = await _apiService.dio.get('/user');
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // 로그인 상태 확인
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // 저장된 사용자명 가져오기
  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }
}
```

###  설명
- **join()**: 회원가입 API 호출
- **login()**: 로그인 API 호출 후 로컬 저장소에 상태 저장
- **logout()**: 로그아웃 API 호출 후 로컬 저장소 정리
- **validateToken()**: 현재 토큰이 유효한지 확인
- **getUserInfo()**: 현재 로그인한 사용자 정보 조회
- **isLoggedIn()**: 로컬 저장소에서 로그인 상태 확인

###  확인 사항
- [ ] `lib/services/auth_service.dart` 파일이 생성되었는지 확인
- [ ] 모든 메서드가 올바르게 작성되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인

---

## 4단계: 로그인 화면 구현

###  목표
사용자가 아이디와 비밀번호를 입력하여 로그인할 수 있는 화면을 구현합니다.

###  작업 내용

#### 4.1 LoginScreen 위젯 생성

`lib/screens/login_screen.dart` 파일을 생성하고 다음 코드를 작성합니다:

```dart
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 폼 검증을 위한 키
  final _formKey = GlobalKey<FormState>();
  
  // 텍스트 입력 컨트롤러
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // 인증 서비스 인스턴스
  final _authService = AuthService();
  
  // 로딩 상태
  bool _isLoading = false;

  // 로그인 처리 함수
  Future<void> _handleLogin() async {
    // 폼 검증
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 로딩 시작
    setState(() {
      _isLoading = true;
    });

    // 로그인 API 호출
    final result = await _authService.login(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    // 로딩 종료
    setState(() {
      _isLoading = false;
    });

    // 화면이 아직 마운트되어 있는지 확인
    if (mounted) {
      if (result['success'] == true) {
        // 로그인 성공 시 홈 화면으로 이동
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // 로그인 실패 시 에러 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'])),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 사용자명 입력 필드
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: '사용자명',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '사용자명을 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // 비밀번호 입력 필드
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true, // 비밀번호 숨김
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // 로그인 버튼
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('로그인'),
                    ),
              const SizedBox(height: 16),
              
              // 회원가입 버튼
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/join');
                },
                child: const Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 컨트롤러 메모리 해제
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

###  설명
- **Form**: 입력값 검증을 위한 폼 위젯
- **TextFormField**: 텍스트 입력 필드 (사용자명, 비밀번호)
- **ElevatedButton**: 로그인 버튼
- **SnackBar**: 에러 메시지를 표시하는 스낵바
- **Navigator**: 화면 전환을 위한 네비게이터

###  확인 사항
- [ ] `lib/screens/login_screen.dart` 파일이 생성되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인
- [ ] UI가 올바르게 구성되었는지 확인

---

## 5단계: 회원가입 화면 구현

###  목표
새로운 사용자가 회원가입할 수 있는 화면을 구현합니다.

###  작업 내용

#### 5.1 JoinScreen 위젯 생성

`lib/screens/join_screen.dart` 파일을 생성하고 다음 코드를 작성합니다:

```dart
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  // 폼 검증을 위한 키
  final _formKey = GlobalKey<FormState>();
  
  // 텍스트 입력 컨트롤러
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  
  // 인증 서비스 인스턴스
  final _authService = AuthService();
  
  // 로딩 상태
  bool _isLoading = false;

  // 회원가입 처리 함수
  Future<void> _handleJoin() async {
    // 폼 검증
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 비밀번호 일치 확인
    if (_passwordController.text != _passwordConfirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호가 일치하지 않습니다')),
      );
      return;
    }

    // 로딩 시작
    setState(() {
      _isLoading = true;
    });

    // 회원가입 API 호출
    final result = await _authService.join(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    // 로딩 종료
    setState(() {
      _isLoading = false;
    });

    // 화면이 아직 마운트되어 있는지 확인
    if (mounted) {
      if (result['success'] == true) {
        // 회원가입 성공 시 성공 메시지 표시 후 로그인 화면으로 돌아가기
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('회원가입 성공')),
        );
        Navigator.pop(context);
      } else {
        // 회원가입 실패 시 에러 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'])),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 사용자명 입력 필드
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: '사용자명',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '사용자명을 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // 비밀번호 입력 필드
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요';
                  }
                  if (value.length < 4) {
                    return '비밀번호는 4자 이상이어야 합니다';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // 비밀번호 확인 입력 필드
              TextFormField(
                controller: _passwordConfirmController,
                decoration: const InputDecoration(
                  labelText: '비밀번호 확인',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호 확인을 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // 회원가입 버튼
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _handleJoin,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('회원가입'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 컨트롤러 메모리 해제
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }
}
```

###  설명
- **비밀번호 확인**: 두 비밀번호가 일치하는지 검증
- **비밀번호 길이 검증**: 최소 4자 이상 입력해야 함
- **회원가입 성공 후**: 로그인 화면으로 자동 이동

###  확인 사항
- [ ] `lib/screens/join_screen.dart` 파일이 생성되었는지 확인
- [ ] 비밀번호 확인 로직이 올바르게 구현되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인

---

## 6단계: 홈 화면 구현

###  목표
로그인 후 사용자 정보를 표시하고 로그아웃할 수 있는 홈 화면을 구현합니다.

###  작업 내용

#### 6.1 HomeScreen 위젯 생성

`lib/screens/home_screen.dart` 파일을 생성하고 다음 코드를 작성합니다:

```dart
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authService = AuthService();
  Map<String, dynamic>? _userInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 화면이 로드될 때 사용자 정보 가져오기
    _loadUserInfo();
  }

  // 사용자 정보 로드 함수
  Future<void> _loadUserInfo() async {
    final userInfo = await _authService.getUserInfo();
    setState(() {
      _userInfo = userInfo;
      _isLoading = false;
    });
  }

  // 로그아웃 처리 함수
  Future<void> _handleLogout() async {
    // 로그아웃 API 호출
    await _authService.logout();
    
    // 화면이 아직 마운트되어 있는지 확인
    if (mounted) {
      // 로그인 화면으로 이동
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
        actions: [
          // 로그아웃 버튼
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: '로그아웃',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _userInfo == null
              ? const Center(child: Text('사용자 정보를 불러올 수 없습니다'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '사용자 정보',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '사용자명: ${_userInfo!['username']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '권한: ${_userInfo!['role']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
```

###  설명
- **initState()**: 화면이 처음 로드될 때 사용자 정보를 가져옴
- **Card**: 사용자 정보를 표시하는 카드 위젯
- **IconButton**: AppBar에 로그아웃 버튼 추가

###  확인 사항
- [ ] `lib/screens/home_screen.dart` 파일이 생성되었는지 확인
- [ ] 사용자 정보가 올바르게 표시되는지 확인
- [ ] 로그아웃 버튼이 제대로 작동하는지 확인

---

## 7단계: 라우팅 및 초기 화면 설정

###  목표
앱의 라우팅을 설정하고, 앱 시작 시 로그인 상태를 확인하여 적절한 화면을 표시합니다.

###  작업 내용

#### 7.1 main.dart 파일 수정

`lib/main.dart` 파일을 열고 다음 코드로 교체합니다:

```dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/join_screen.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 인증 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 초기 화면을 SplashScreen으로 설정
      initialRoute: '/',
      // 라우트 설정
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/join': (context) => const JoinScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

// 스플래시 화면 (로그인 상태 확인)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 로그인 상태 확인
    _checkLoginStatus();
  }

  // 로그인 상태 확인 함수
  Future<void> _checkLoginStatus() async {
    final authService = AuthService();
    
    // 로컬 저장소에서 로그인 상태 확인
    final isLoggedIn = await authService.isLoggedIn();
    
    // 화면이 아직 마운트되어 있는지 확인
    if (mounted) {
      if (isLoggedIn) {
        // 로그인 상태라면 토큰 유효성 검증
        final isValid = await authService.validateToken();
        if (isValid) {
          // 토큰이 유효하면 홈 화면으로 이동
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          // 토큰이 무효하면 로그인 화면으로 이동
          Navigator.pushReplacementNamed(context, '/login');
        }
      } else {
        // 로그인 상태가 아니면 로그인 화면으로 이동
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
```

###  설명
- **MaterialApp**: 앱의 루트 위젯
- **routes**: 화면 경로 설정
- **SplashScreen**: 앱 시작 시 로그인 상태를 확인하는 화면
- **Navigator.pushReplacementNamed**: 화면 전환 (이전 화면으로 돌아갈 수 없음)

###  확인 사항
- [ ] `lib/main.dart` 파일이 올바르게 수정되었는지 확인
- [ ] 모든 화면이 라우트에 등록되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인

---

## 8단계: 테스트 및 확인

###  목표
구현한 앱이 정상적으로 작동하는지 테스트하고 확인합니다.

###  테스트 절차

#### 8.1 백엔드 서버 확인
1. 백엔드 서버(F04AuthBn)가 실행 중인지 확인
2. 브라우저에서 `http://localhost:8090/validate` 접속 테스트
3. MySQL과 Redis가 실행 중인지 확인

#### 8.2 앱 실행
터미널에서 다음 명령어를 실행합니다:

```bash
cd F04AuthApp
flutter run
```

#### 8.3 회원가입 테스트
1. 앱 실행 후 로그인 화면에서 "회원가입" 버튼 클릭
2. 사용자명과 비밀번호 입력
3. "회원가입" 버튼 클릭
4. 성공 메시지 확인
5. 로그인 화면으로 자동 이동 확인

#### 8.4 로그인 테스트
1. 회원가입한 사용자명과 비밀번호 입력
2. "로그인" 버튼 클릭
3. 홈 화면으로 이동 확인
4. 사용자 정보가 표시되는지 확인

#### 8.5 사용자 정보 확인
1. 홈 화면에서 사용자명과 권한이 표시되는지 확인
2. 정보가 올바르게 표시되는지 확인

#### 8.6 로그아웃 테스트
1. 홈 화면에서 로그아웃 버튼(우측 상단) 클릭
2. 로그인 화면으로 이동 확인
3. 다시 로그인할 수 있는지 확인

#### 8.7 토큰 갱신 테스트 (선택사항)
1. 로그인 후 30초 이상 대기 (Access Token 만료 시간)
2. 홈 화면에서 새로고침 또는 다른 API 호출
3. 자동으로 토큰이 갱신되어 정상 작동하는지 확인

###  최종 확인 사항
- [ ] 회원가입이 정상적으로 작동하는가?
- [ ] 로그인이 정상적으로 작동하는가?
- [ ] 홈 화면에 사용자 정보가 표시되는가?
- [ ] 로그아웃이 정상적으로 작동하는가?
- [ ] 에러 메시지가 올바르게 표시되는가?
- [ ] 로딩 인디케이터가 표시되는가?

###  문제 해결

#### 문제 1: "Connection refused" 에러
**원인**: 백엔드 서버가 실행되지 않음
**해결**: 백엔드 서버를 실행하고 포트 8090이 열려있는지 확인

#### 문제 2: 쿠키가 저장되지 않음
**원인**: CORS 설정 문제 또는 쿠키 관리자 미설정
**해결**: 
- `ApiService`에 `CookieManager`가 추가되었는지 확인
- 백엔드의 CORS 설정 확인

#### 문제 3: 401 Unauthorized 에러
**원인**: 토큰이 만료되었거나 없음
**해결**: 
- 다시 로그인하여 새 토큰 발급
- 백엔드 로그 확인

#### 문제 4: 화면 전환이 안 됨
**원인**: 라우트 설정 오류
**해결**: 
- `main.dart`의 `routes` 설정 확인
- 화면 이름이 정확한지 확인

---

##  추가 학습 자료

### 다음 단계
1. **에러 처리 개선**: 더 상세한 에러 메시지 표시
2. **로딩 상태 관리**: 전역 로딩 상태 관리
3. **토큰 자동 갱신**: 토큰 만료 전 자동 갱신 로직
4. **OAuth2 로그인**: 소셜 로그인 기능 추가
5. **프로필 수정**: 사용자 정보 수정 기능

### 참고 자료
- [Flutter 공식 문서](https://docs.flutter.dev/)
- [Dio 패키지 문서](https://pub.dev/packages/dio)
- [SharedPreferences 문서](https://pub.dev/packages/shared_preferences)
- [Spring Security 문서](https://spring.io/projects/spring-security)

---

##  완료!

축하합니다! Flutter 인증 앱을 성공적으로 구현했습니다.

이제 다음 기능들을 추가로 구현해볼 수 있습니다:
- 사용자 프로필 수정
- 비밀번호 변경
- OAuth2 소셜 로그인
- 토큰 자동 갱신
- 에러 처리 개선

