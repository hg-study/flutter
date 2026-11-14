# ch06-03: Checkbox와 Switch - 코드 설명

##  학습 목표
- Checkbox 사용법
- Switch 사용법
- CheckboxListTile, SwitchListTile 사용

---

##  중요 코드 설명

### 1. CheckboxListTile

```dart
CheckboxListTile(
  title: Text('약관에 동의합니다'),
  value: _isChecked,
  onChanged: (value) {
    setState(() {
      _isChecked = value ?? false;
    });
  },
)
```

**핵심 포인트:**
- `value`: 체크 상태
- `onChanged`: 상태 변경 이벤트

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Checkbox를 사용할 수 있습니다
- [ ] Switch를 사용할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch06_form_input/ch06-03_checkbox_switch.dart
```

