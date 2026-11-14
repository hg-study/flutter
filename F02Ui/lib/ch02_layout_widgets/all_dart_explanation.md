# -------------------------------------------
# 02단계: 레이아웃 위젯
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 레이아웃 위젯을 학습합니다:
- Container: 크기, 여백, 색상 설정
- Padding: 여백 추가
- Row: 가로 배치
- Column: 세로 배치
- Stack: 겹쳐서 배치
- Expanded/Flexible: 공간 분배
- SizedBox: 고정 크기
- Center: 중앙 정렬

---

# -------------------------------------------
# 1. Container
# -------------------------------------------

## 1.1 기본 사용법

```dart
Container(
  width: 200,
  height: 100,
  color: Colors.blue,
  child: Text('내용'),
)
```

**주요 속성:**
- `width`, `height`: 크기 설정
- `color`: 배경색
- `decoration`: 장식 (BoxDecoration)
- `padding`: 내부 여백
- `margin`: 외부 여백
- `child`: 자식 위젯

## 1.2 BoxDecoration 사용

```dart
Container(
  decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.black, width: 2),
  ),
)
```

**BoxDecoration 속성:**
- `color`: 배경색
- `borderRadius`: 모서리 둥글게
- `border`: 테두리
- `boxShadow`: 그림자
- `gradient`: 그라데이션

---

# -------------------------------------------
# 2. Padding
# -------------------------------------------

## 2.1 기본 사용법

```dart
Padding(
  padding: EdgeInsets.all(16.0),
  child: Text('내용'),
)
```

**EdgeInsets 종류:**
- `EdgeInsets.all(16)`: 모든 방향
- `EdgeInsets.symmetric(horizontal: 16, vertical: 8)`: 대칭
- `EdgeInsets.only(left: 16, top: 8)`: 특정 방향
- `EdgeInsets.fromLTRB(16, 8, 16, 8)`: 좌상우하

## 2.2 Container의 padding vs Padding 위젯

```dart
// 방법 1: Container 사용
Container(
  padding: EdgeInsets.all(16),
  child: Text('내용'),
)

// 방법 2: Padding 위젯 사용
Padding(
  padding: EdgeInsets.all(16),
  child: Text('내용'),
)
```

- Container는 여러 속성 조합 가능
- Padding은 여백만 필요할 때 사용

---

# -------------------------------------------
# 3. Row (가로 배치)
# -------------------------------------------

## 3.1 기본 사용법

```dart
Row(
  children: [
    Text('첫 번째'),
    Text('두 번째'),
    Text('세 번째'),
  ],
)
```

**주요 속성:**
- `children`: 자식 위젯 리스트
- `mainAxisAlignment`: 주축 정렬
- `crossAxisAlignment`: 교차축 정렬
- `mainAxisSize`: 주축 크기

## 3.2 mainAxisAlignment

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.start,    // 시작
  mainAxisAlignment: MainAxisAlignment.center,    // 중앙
  mainAxisAlignment: MainAxisAlignment.end,      // 끝
  mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 양 끝
  mainAxisAlignment: MainAxisAlignment.spaceAround,   // 주변 공간
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 균등 공간
  children: [...],
)
```

---

# -------------------------------------------
# 4. Column (세로 배치)
# -------------------------------------------

## 4.1 기본 사용법

```dart
Column(
  children: [
    Text('첫 번째'),
    Text('두 번째'),
    Text('세 번째'),
  ],
)
```

**Row와 동일한 속성:**
- `mainAxisAlignment`: 세로 정렬
- `crossAxisAlignment`: 가로 정렬
- `mainAxisSize`: 세로 크기

## 4.2 Row vs Column

- **Row**: 가로 방향 배치 (주축: 가로)
- **Column**: 세로 방향 배치 (주축: 세로)
- 속성 사용법은 동일

---

# -------------------------------------------
# 5. Stack (겹쳐서 배치)
# -------------------------------------------

## 5.1 기본 사용법

```dart
Stack(
  children: [
    Container(color: Colors.blue),
    Positioned(
      top: 20,
      left: 20,
      child: Container(color: Colors.red),
    ),
  ],
)
```

**특징:**
- 위젯을 겹쳐서 배치
- Positioned로 위치 지정
- 순서대로 쌓임 (나중 것이 위)

## 5.2 Positioned

```dart
Positioned(
  top: 20,      // 위에서 20
  left: 20,     // 왼쪽에서 20
  right: 20,    // 오른쪽에서 20
  bottom: 20,   // 아래에서 20
  child: Widget(...),
)
```

---

# -------------------------------------------
# 6. Expanded / Flexible
# -------------------------------------------

## 6.1 Expanded

```dart
Row(
  children: [
    Expanded(
      flex: 1,
      child: Container(color: Colors.red),
    ),
    Expanded(
      flex: 2,
      child: Container(color: Colors.blue),
    ),
  ],
)
```

**특징:**
- 남은 공간을 차지
- `flex`: 비율 (기본값 1)
- Row/Column 내부에서만 사용

## 6.2 Flexible

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

**Expanded vs Flexible:**
- **Expanded**: 남은 공간을 모두 차지 (필수)
- **Flexible**: 필요할 때만 공간 차지 (선택)

---

# -------------------------------------------
# 7. SizedBox
# -------------------------------------------

## 7.1 기본 사용법

```dart
SizedBox(
  width: 100,
  height: 50,
  child: Widget(...),
)
```

**용도:**
- 고정 크기 지정
- 간격 추가 (빈 SizedBox)
- 최소/최대 크기 제한

## 7.2 간격으로 사용

```dart
Column(
  children: [
    Text('첫 번째'),
    SizedBox(height: 16),  // 간격
    Text('두 번째'),
  ],
)
```

---

# -------------------------------------------
# 8. Center
# -------------------------------------------

## 8.1 기본 사용법

```dart
Center(
  child: Text('중앙 정렬'),
)
```

**특징:**
- 자식 위젯을 중앙에 배치
- 가로, 세로 모두 중앙
- Container의 alignment로도 가능

---

# -------------------------------------------
# 실전 예제
# -------------------------------------------

## 예제 1: 프로필 카드

```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey),
  ),
  child: Row(
    children: [
      CircleAvatar(radius: 30),
      SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('이름'),
            Text('설명'),
          ],
        ),
      ),
    ],
  ),
)
```

## 예제 2: 버튼 그룹

```dart
Row(
  children: [
    Expanded(
      child: ElevatedButton(onPressed: () {}, child: Text('버튼1')),
    ),
    SizedBox(width: 8),
    Expanded(
      child: ElevatedButton(onPressed: () {}, child: Text('버튼2')),
    ),
  ],
)
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] Container로 크기와 색상을 설정할 수 있습니다
- [ ] Padding으로 여백을 추가할 수 있습니다
- [ ] Row로 가로 배치를 할 수 있습니다
- [ ] Column으로 세로 배치를 할 수 있습니다
- [ ] Stack으로 위젯을 겹쳐 배치할 수 있습니다
- [ ] Expanded와 Flexible을 사용할 수 있습니다
- [ ] SizedBox로 크기와 간격을 설정할 수 있습니다
- [ ] Center로 중앙 정렬을 할 수 있습니다
- [ ] 여러 레이아웃 위젯을 조합할 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F02Ui
flutter run lib/ch02_layout_widgets/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

02단계를 완료했다면 다음 단계로 진행하세요:
- **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar

## 전체 커리큘럼

1. 완료 **01단계: 위젯 기초** - StatelessWidget, StatefulWidget
2. 완료 **02단계: 레이아웃 위젯** - Container, Row, Column, Stack (현재 단계)
3. 다음 **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar
4. 다음 **04단계: 리스트와 그리드** - ListView, GridView, Card
5. 다음 **05단계: 네비게이션** - Navigator, Routes
6. 다음 **06단계: 폼과 입력** - TextField, Form, Checkbox
7. 다음 **07단계: 테마와 스타일링** - ThemeData, ColorScheme
8. 다음 **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **레이아웃 선택 가이드**
   - 가로 배치: Row
   - 세로 배치: Column
   - 겹치기: Stack
   - 공간 분배: Expanded/Flexible

2. **정렬 이해하기**
   - mainAxisAlignment: 주축 정렬
   - crossAxisAlignment: 교차축 정렬
   - Row: 주축=가로, 교차축=세로
   - Column: 주축=세로, 교차축=가로

3. **크기 제약**
   - 무한 크기 오류 주의
   - Expanded로 해결
   - SizedBox로 고정 크기

4. **실전 활용**
   - Container: 스타일링이 필요할 때
   - Padding: 여백만 필요할 때
   - SizedBox: 간격이나 고정 크기
   - Center: 중앙 정렬이 필요할 때

