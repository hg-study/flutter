# -------------------------------------------
# 07단계: 테마와 스타일링
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 테마와 스타일링을 학습합니다:
- ThemeData: 앱 테마
- ColorScheme: 색상 스킴
- TextStyle: 텍스트 스타일
- BoxDecoration: 컨테이너 장식
- BorderRadius: 모서리 둥글게
- Gradient: 그라데이션
- Shadow: 그림자

---

# -------------------------------------------
# 1. ThemeData
# -------------------------------------------

## 1.1 기본 사용법

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  ),
)
```

**주요 속성:**
- `colorScheme`: 색상 스킴
- `textTheme`: 텍스트 테마
- `useMaterial3`: Material 3 사용

## 1.2 다크 모드

```dart
MaterialApp(
  theme: ThemeData.light(),
  darkTheme: ThemeData.dark(),
  themeMode: ThemeMode.system,
)
```

---

# -------------------------------------------
# 2. ColorScheme
# -------------------------------------------

## 2.1 기본 색상

```dart
Theme.of(context).colorScheme.primary
Theme.of(context).colorScheme.secondary
Theme.of(context).colorScheme.error
Theme.of(context).colorScheme.surface
```

## 2.2 커스텀 ColorScheme

```dart
ColorScheme.fromSeed(seedColor: Colors.blue)
```

---

# -------------------------------------------
# 3. TextStyle
# -------------------------------------------

## 3.1 기본 사용법

```dart
TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
)
```

## 3.2 TextTheme

```dart
TextTheme(
  displayLarge: TextStyle(fontSize: 32),
  bodyLarge: TextStyle(fontSize: 16),
)
```

---

# -------------------------------------------
# 4. BoxDecoration
# -------------------------------------------

## 4.1 기본 사용법

```dart
BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(color: Colors.black),
)
```

## 4.2 Gradient

```dart
BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.purple],
  ),
)
```

## 4.3 Shadow

```dart
BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ],
)
```

---

# -------------------------------------------
# 5. BorderRadius
# -------------------------------------------

## 5.1 기본 사용법

```dart
BorderRadius.circular(16)
BorderRadius.all(Radius.circular(16))
BorderRadius.only(
  topLeft: Radius.circular(16),
  topRight: Radius.circular(16),
)
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] ThemeData로 테마를 설정할 수 있습니다
- [ ] ColorScheme을 사용할 수 있습니다
- [ ] TextStyle을 적용할 수 있습니다
- [ ] BoxDecoration으로 스타일링할 수 있습니다
- [ ] BorderRadius를 사용할 수 있습니다
- [ ] Gradient를 사용할 수 있습니다
- [ ] Shadow를 사용할 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F02Ui
flutter run lib/ch07_theme_styling/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

07단계를 완료했다면 다음 단계로 진행하세요:
- **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea

## 전체 커리큘럼

1. 완료 **01단계: 위젯 기초** - StatelessWidget, StatefulWidget
2. 완료 **02단계: 레이아웃 위젯** - Container, Row, Column, Stack
3. 완료 **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar
4. 완료 **04단계: 리스트와 그리드** - ListView, GridView, Card
5. 완료 **05단계: 네비게이션** - Navigator, Routes
6. 완료 **06단계: 폼과 입력** - TextField, Form, Checkbox
7. 완료 **07단계: 테마와 스타일링** - ThemeData, ColorScheme (현재 단계)
8. 다음 **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea

