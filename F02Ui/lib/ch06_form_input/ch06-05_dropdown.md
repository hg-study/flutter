# ch06-05: DropdownButton - 코드 설명

##  학습 목표
- DropdownButton 사용법
- DropdownButtonFormField 사용
- 드롭다운 메뉴 구성

---

##  중요 코드 설명

### 1. DropdownButtonFormField

```dart
DropdownButtonFormField<String>(
  value: _selectedValue,
  items: _options.map((option) {
    return DropdownMenuItem<String>(
      value: option,
      child: Text(option),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      _selectedValue = value!;
    });
  },
)
```

**핵심 포인트:**
- `items`: 옵션 리스트
- `DropdownMenuItem`: 각 옵션

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] DropdownButton을 사용할 수 있습니다
- [ ] DropdownButtonFormField를 사용할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch06_form_input/ch06-05_dropdown.dart
```

