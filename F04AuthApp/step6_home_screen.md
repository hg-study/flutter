# 단계 6: 홈 화면 구현

##  목표
로그인 후 사용자 정보를 표시하고 로그아웃할 수 있는 홈 화면을 구현합니다.

##  작업 내용

### 6.1 HomeScreen 위젯 생성

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

##  코드 설명

### 주요 기능

1. **initState()**: 화면이 처음 로드될 때 실행
   - `_loadUserInfo()` 호출하여 사용자 정보 가져오기

2. **_loadUserInfo()**: 사용자 정보 로드
   - `AuthService.getUserInfo()` 호출
   - 로딩 상태 관리 (`_isLoading`)
   - 사용자 정보 저장 (`_userInfo`)

3. **_handleLogout()**: 로그아웃 처리
   - `AuthService.logout()` 호출
   - 로그인 화면으로 이동

### UI 구성

1. **AppBar**: 상단 바
   - 제목: "홈"
   - 로그아웃 버튼 (우측 상단)

2. **로딩 상태**: `CircularProgressIndicator` 표시
   - 사용자 정보를 가져오는 중일 때

3. **사용자 정보 표시**: Card 위젯 사용
   - 사용자명
   - 권한 (ROLE_USER, ROLE_ADMIN 등)

### 상태 관리

- `_isLoading`: 로딩 상태
- `_userInfo`: 사용자 정보 (Map 형태)

##  확인 사항
- [ ] `lib/screens/home_screen.dart` 파일이 생성되었는지 확인
- [ ] 사용자 정보가 올바르게 표시되는지 확인
- [ ] 로그아웃 버튼이 제대로 작동하는지 확인

##  문제 해결

### 사용자 정보가 표시되지 않는 경우
- 백엔드 서버가 실행 중인지 확인
- 쿠키에 토큰이 포함되어 있는지 확인
- API 응답 확인 (백엔드 로그 확인)

### 로그아웃이 작동하지 않는 경우
- `AuthService.logout()` 메서드 확인
- 네비게이션 라우트 확인

##  다음 단계
다음 단계에서는 라우팅을 설정합니다.
→ [단계7: 라우팅 설정](./step7_routing.md)

