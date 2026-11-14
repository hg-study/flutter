# 단계 3: 인증 서비스 구현

##  목표
로그인, 회원가입, 로그아웃 등 인증 관련 기능을 처리하는 서비스 클래스를 구현합니다.

##  작업 내용

### 3.1 AuthService 클래스 생성

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

##  메서드 설명

### 1. join() - 회원가입
- **기능**: 새로운 사용자 계정 생성
- **파라미터**: username, password
- **반환**: 성공/실패 여부와 메시지

### 2. login() - 로그인
- **기능**: 사용자 인증 및 토큰 발급
- **파라미터**: username, password
- **동작**:
  1. 백엔드에 로그인 요청
  2. 성공 시 쿠키에 JWT 토큰 저장 (자동)
  3. 로컬 저장소에 로그인 상태 저장
- **반환**: 성공/실패 여부와 메시지

### 3. logout() - 로그아웃
- **기능**: 로그아웃 처리
- **동작**:
  1. 백엔드에 로그아웃 요청
  2. 로컬 저장소에서 로그인 정보 삭제

### 4. validateToken() - 토큰 검증
- **기능**: 현재 토큰이 유효한지 확인
- **반환**: 유효 여부 (true/false)

### 5. getUserInfo() - 사용자 정보 조회
- **기능**: 현재 로그인한 사용자 정보 가져오기
- **반환**: 사용자 정보 (username, role) 또는 null

### 6. isLoggedIn() - 로그인 상태 확인
- **기능**: 로컬 저장소에서 로그인 상태 확인
- **반환**: 로그인 여부 (true/false)

### 7. getUsername() - 사용자명 가져오기
- **기능**: 저장된 사용자명 가져오기
- **반환**: 사용자명 또는 null

##  보안 고려사항

### SharedPreferences 사용 이유
- 로그인 상태만 저장 (토큰은 쿠키에 저장)
- 앱 재시작 시 로그인 상태 확인용
- 실제 인증은 서버의 JWT 토큰으로 처리

### 에러 처리
- `DioException`: 네트워크 오류 처리
- `try-catch`: 예외 상황 처리
- 사용자에게 명확한 에러 메시지 제공

##  확인 사항
- [ ] `lib/services/auth_service.dart` 파일이 생성되었는지 확인
- [ ] 모든 메서드가 올바르게 작성되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인

##  문제 해결

### API 호출 실패 시
- 백엔드 서버가 실행 중인지 확인
- 네트워크 연결 확인
- CORS 설정 확인

### 쿠키가 저장되지 않는 경우
- `ApiService`의 `CookieManager` 확인
- 백엔드 CORS 설정 확인

##  다음 단계
다음 단계에서는 로그인 화면을 구현합니다.
→ [단계4: 로그인 화면 구현](./step4_login_screen.md)

