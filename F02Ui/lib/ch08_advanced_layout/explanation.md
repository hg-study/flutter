# -------------------------------------------
# 08단계: 고급 레이아웃
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 고급 레이아웃 위젯을 학습합니다:
- Wrap: 자동 줄바꿈
- Flexible/Expanded: 유연한 크기
- AspectRatio: 비율 유지
- ConstrainedBox: 크기 제약
- SingleChildScrollView: 스크롤 뷰
- SafeArea: 안전 영역
- LayoutBuilder: 반응형 레이아웃

---

# -------------------------------------------
# 1. Wrap
# -------------------------------------------

## 1.1 기본 사용법

```dart
Wrap(
  spacing: 8,
  runSpacing: 8,
  children: [
    Chip(label: Text('태그 1')),
    Chip(label: Text('태그 2')),
    Chip(label: Text('태그 3')),
  ],
)
```

**특징:**
- 자동 줄바꿈
- Row/Column의 오버플로우 해결
- spacing, runSpacing으로 간격 조절

---

# -------------------------------------------
# 2. Flexible vs Expanded
# -------------------------------------------

## 2.1 Expanded

```dart
Row(
  children: [
    Expanded(
      flex: 2,
      child: Container(color: Colors.red),
    ),
    Expanded(
      flex: 1,
      child: Container(color: Colors.blue),
    ),
  ],
)
```

**특징:**
- 남은 공간을 모두 차지 (필수)
- flex로 비율 조절

## 2.2 Flexible

```dart
Row(
  children: [
    Flexible(
      child: Container(color: Colors.red),
    ),
    Container(width: 100, color: Colors.blue),
  ],
)
```

**특징:**
- 필요할 때만 공간 차지 (선택)
- 고정 크기 위젯과 함께 사용

---

# -------------------------------------------
# 3. AspectRatio
# -------------------------------------------

## 3.1 기본 사용법

```dart
AspectRatio(
  aspectRatio: 16 / 9,
  child: Container(color: Colors.blue),
)
```

**특징:**
- 비율 유지
- 이미지, 비디오에 유용

---

# -------------------------------------------
# 4. ConstrainedBox
# -------------------------------------------

## 4.1 기본 사용법

```dart
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 100,
    maxWidth: 200,
    minHeight: 50,
    maxHeight: 100,
  ),
  child: Container(...),
)
```

**특징:**
- 크기 제약 설정
- 최소/최대 크기 지정

---

# -------------------------------------------
# 5. SingleChildScrollView
# -------------------------------------------

## 5.1 기본 사용법

```dart
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [...],
  ),
)
```

**특징:**
- 스크롤 가능한 뷰
- 가로/세로 스크롤
- 오버플로우 방지

---

# -------------------------------------------
# 6. SafeArea
# -------------------------------------------

## 6.1 기본 사용법

```dart
SafeArea(
  child: Container(...),
)
```

**특징:**
- 안전 영역 내에 배치
- 노치, 상태바 등 피함
- 모든 화면에서 사용 권장

---

# -------------------------------------------
# 7. LayoutBuilder
# -------------------------------------------

## 7.1 기본 사용법

```dart
LayoutBuilder(
  builder: (context, constraints) {
    final isWide = constraints.maxWidth > 600;
    return isWide ? Row(...) : Column(...);
  },
)
```

**특징:**
- 화면 크기에 따라 레이아웃 변경
- 반응형 디자인
- constraints로 크기 정보 접근

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] Wrap으로 자동 줄바꿈을 할 수 있습니다
- [ ] Flexible과 Expanded의 차이를 이해했습니다
- [ ] AspectRatio로 비율을 유지할 수 있습니다
- [ ] ConstrainedBox로 크기를 제약할 수 있습니다
- [ ] SingleChildScrollView로 스크롤을 할 수 있습니다
- [ ] SafeArea를 사용할 수 있습니다
- [ ] LayoutBuilder로 반응형 레이아웃을 만들 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F02Ui
flutter run lib/ch08_advanced_layout/main.dart
```

---

# -------------------------------------------
# 커리큘럼 완료
# -------------------------------------------

축하합니다! 모든 단계를 완료했습니다!

## 전체 커리큘럼

1. 완료 **01단계: 위젯 기초** - StatelessWidget, StatefulWidget
2. 완료 **02단계: 레이아웃 위젯** - Container, Row, Column, Stack
3. 완료 **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar
4. 완료 **04단계: 리스트와 그리드** - ListView, GridView, Card
5. 완료 **05단계: 네비게이션** - Navigator, Routes
6. 완료 **06단계: 폼과 입력** - TextField, Form, Checkbox
7. 완료 **07단계: 테마와 스타일링** - ThemeData, ColorScheme
8. 완료 **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea (현재 단계)

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **레이아웃 선택**
   - 오버플로우: Wrap 사용
   - 공간 분배: Expanded/Flexible
   - 반응형: LayoutBuilder

2. **성능 최적화**
   - 불필요한 rebuild 방지
   - const 위젯 사용
   - 적절한 위젯 선택

3. **실전 활용**
   - SafeArea: 모든 화면에 적용
   - LayoutBuilder: 다양한 화면 크기 대응
   - Wrap: 태그, 칩 등에 사용

