# -------------------------------------------
# 06단계: 폼과 입력
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 폼과 입력 위젯을 학습합니다:
- TextField: 텍스트 입력
- TextFormField: 폼 텍스트 입력
- Form: 폼 컨테이너
- Checkbox: 체크박스
- Radio: 라디오 버튼
- Switch: 스위치
- Slider: 슬라이더
- DropdownButton: 드롭다운

---

# -------------------------------------------
# 1. TextField
# -------------------------------------------

## 1.1 기본 사용법

```dart
TextField(
  decoration: InputDecoration(
    labelText: '이름',
    border: OutlineInputBorder(),
  ),
)
```

**주요 속성:**
- `decoration`: InputDecoration으로 스타일
- `controller`: TextEditingController로 값 제어
- `onChanged`: 값 변경 시 콜백

## 1.2 InputDecoration

```dart
InputDecoration(
  labelText: '라벨',
  hintText: '힌트',
  prefixIcon: Icon(Icons.person),
  suffixIcon: Icon(Icons.clear),
  border: OutlineInputBorder(),
)
```

---

# -------------------------------------------
# 2. TextFormField
# -------------------------------------------

## 2.1 기본 사용법

```dart
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return '값을 입력하세요';
    }
    return null;
  },
)
```

**특징:**
- Form 내부에서 사용
- validator로 검증
- FormState로 전체 검증

## 2.2 Form 사용

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(...),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // 제출
          }
        },
        child: Text('제출'),
      ),
    ],
  ),
)
```

---

# -------------------------------------------
# 3. Checkbox
# -------------------------------------------

## 3.1 기본 사용법

```dart
bool _isChecked = false;

Checkbox(
  value: _isChecked,
  onChanged: (value) {
    setState(() {
      _isChecked = value ?? false;
    });
  },
)
```

## 3.2 CheckboxListTile

```dart
CheckboxListTile(
  title: Text('약관 동의'),
  value: _isChecked,
  onChanged: (value) {
    setState(() {
      _isChecked = value ?? false;
    });
  },
)
```

---

# -------------------------------------------
# 4. Radio
# -------------------------------------------

## 4.1 기본 사용법

```dart
String _selectedValue = '옵션 1';

RadioListTile<String>(
  title: Text('옵션 1'),
  value: '옵션 1',
  groupValue: _selectedValue,
  onChanged: (value) {
    setState(() {
      _selectedValue = value!;
    });
  },
)
```

**특징:**
- groupValue로 그룹 지정
- 하나만 선택 가능

---

# -------------------------------------------
# 5. Switch
# -------------------------------------------

## 5.1 기본 사용법

```dart
bool _switchValue = false;

Switch(
  value: _switchValue,
  onChanged: (value) {
    setState(() {
      _switchValue = value;
    });
  },
)
```

## 5.2 SwitchListTile

```dart
SwitchListTile(
  title: Text('알림 받기'),
  value: _switchValue,
  onChanged: (value) {
    setState(() {
      _switchValue = value;
    });
  },
)
```

---

# -------------------------------------------
# 6. Slider
# -------------------------------------------

## 6.1 기본 사용법

```dart
double _sliderValue = 50;

Slider(
  value: _sliderValue,
  min: 0,
  max: 100,
  onChanged: (value) {
    setState(() {
      _sliderValue = value;
    });
  },
)
```

**주요 속성:**
- `min`, `max`: 범위
- `divisions`: 구간 수
- `label`: 라벨 표시

---

# -------------------------------------------
# 7. DropdownButton
# -------------------------------------------

## 7.1 기본 사용법

```dart
String _selectedValue = '옵션 1';

DropdownButton<String>(
  value: _selectedValue,
  items: [
    DropdownMenuItem(value: '옵션 1', child: Text('옵션 1')),
    DropdownMenuItem(value: '옵션 2', child: Text('옵션 2')),
  ],
  onChanged: (value) {
    setState(() {
      _selectedValue = value!;
    });
  },
)
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] TextField로 텍스트를 입력받을 수 있습니다
- [ ] TextFormField로 검증을 할 수 있습니다
- [ ] Form으로 폼을 관리할 수 있습니다
- [ ] Checkbox를 사용할 수 있습니다
- [ ] Radio를 사용할 수 있습니다
- [ ] Switch를 사용할 수 있습니다
- [ ] Slider를 사용할 수 있습니다
- [ ] DropdownButton을 사용할 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F02Ui
flutter run lib/ch06_form_input/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

06단계를 완료했다면 다음 단계로 진행하세요:
- **07단계: 테마와 스타일링** - ThemeData, ColorScheme

## 전체 커리큘럼

1. 완료 **01단계: 위젯 기초** - StatelessWidget, StatefulWidget
2. 완료 **02단계: 레이아웃 위젯** - Container, Row, Column, Stack
3. 완료 **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar
4. 완료 **04단계: 리스트와 그리드** - ListView, GridView, Card
5. 완료 **05단계: 네비게이션** - Navigator, Routes
6. 완료 **06단계: 폼과 입력** - TextField, Form, Checkbox (현재 단계)
7. 다음 **07단계: 테마와 스타일링** - ThemeData, ColorScheme
8. 다음 **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea

