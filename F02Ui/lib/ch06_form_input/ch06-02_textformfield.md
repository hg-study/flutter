# ch06-02: TextFormField - 코드 설명

##  학습 목표
- TextFormField 사용법
- validator로 검증
- Form과 GlobalKey 사용

---

##  중요 코드 설명

### 1. Form과 TextFormField

```dart
Form(
  key: _formKey,
  child: TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '입력하세요';
      }
      return null;
    },
  ),
)
```

**핵심 포인트:**
- `Form`: 폼 위젯
- `GlobalKey<FormState>`: 폼 상태 관리
- `validator`: 검증 함수

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] TextFormField를 사용할 수 있습니다
- [ ] validator로 검증할 수 있습니다
- [ ] Form을 사용할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch06_form_input/ch06-02_textformfield.dart
```

