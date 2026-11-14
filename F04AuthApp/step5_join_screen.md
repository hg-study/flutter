# 단계 5: 회원가입 화면 구현

##  목표
새로운 사용자가 회원가입할 수 있는 화면을 구현합니다.

##  작업 내용

### 5.1 JoinScreen 위젯 생성

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

##  코드 설명

### 로그인 화면과의 차이점

1. **비밀번호 확인 필드 추가**
   - 사용자가 비밀번호를 정확히 입력했는지 확인
   - 두 비밀번호가 일치하는지 검증

2. **비밀번호 길이 검증**
   - 최소 4자 이상 입력해야 함
   - `validator`에서 길이 체크

3. **회원가입 성공 후 처리**
   - 성공 메시지 표시
   - `Navigator.pop()`: 이전 화면(로그인 화면)으로 돌아가기

### 검증 로직

1. **폼 검증**: 모든 필드가 입력되었는지 확인
2. **비밀번호 일치 확인**: 두 비밀번호가 같은지 확인
3. **비밀번호 길이 확인**: 최소 4자 이상인지 확인

##  확인 사항
- [ ] `lib/screens/join_screen.dart` 파일이 생성되었는지 확인
- [ ] 비밀번호 확인 로직이 올바르게 구현되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인

##  문제 해결

### 비밀번호 확인이 작동하지 않는 경우
- 두 컨트롤러의 값을 비교하는 로직 확인
- `_handleJoin()` 함수에서 비교 로직 확인

### 화면 전환이 안 되는 경우
- `Navigator.pop()` 사용 확인
- 이전 화면이 존재하는지 확인

##  다음 단계
다음 단계에서는 홈 화면을 구현합니다.
→ [단계6: 홈 화면 구현](./step6_home_screen.md)

