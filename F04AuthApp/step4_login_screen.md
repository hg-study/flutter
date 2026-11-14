# 단계 4: 로그인 화면 구현

##  목표
사용자가 아이디와 비밀번호를 입력하여 로그인할 수 있는 화면을 구현합니다.

##  작업 내용

### 4.1 LoginScreen 위젯 생성

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

##  코드 설명

### 주요 위젯

1. **Form**: 입력값 검증을 위한 폼 위젯
   - `GlobalKey<FormState>`: 폼 상태 관리
   - `validate()`: 모든 필드 검증

2. **TextFormField**: 텍스트 입력 필드
   - `controller`: 입력값 관리
   - `validator`: 입력값 검증 함수
   - `obscureText`: 비밀번호 숨김 처리

3. **ElevatedButton**: 로그인 버튼
   - 로딩 중일 때는 `CircularProgressIndicator` 표시

4. **SnackBar**: 에러 메시지 표시
   - 로그인 실패 시 사용자에게 알림

5. **Navigator**: 화면 전환
   - `pushReplacementNamed`: 현재 화면을 대체하며 이동

### 상태 관리

- `_isLoading`: 로그인 요청 중인지 표시
- `mounted`: 위젯이 아직 마운트되어 있는지 확인 (비동기 작업 후 화면 전환 시 필요)

### 메모리 관리

- `dispose()`: 컨트롤러 메모리 해제
- 위젯이 제거될 때 자동으로 호출됨

##  확인 사항
- [ ] `lib/screens/login_screen.dart` 파일이 생성되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인
- [ ] UI가 올바르게 구성되었는지 확인

##  문제 해결

### 화면 전환 오류
- 라우트가 등록되어 있는지 확인 (`main.dart`의 `routes`)
- `Navigator.pushReplacementNamed` 사용 확인

### 폼 검증이 작동하지 않는 경우
- `Form` 위젯이 `key`를 가지고 있는지 확인
- `validator` 함수가 올바르게 작성되었는지 확인

##  다음 단계
다음 단계에서는 회원가입 화면을 구현합니다.
→ [단계5: 회원가입 화면 구현](./step5_join_screen.md)

