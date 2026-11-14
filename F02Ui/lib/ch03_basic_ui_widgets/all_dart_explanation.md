# -------------------------------------------
# 03단계: 기본 UI 위젯
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 기본 UI 위젯을 학습합니다:
- Text: 텍스트 표시
- Image: 이미지 표시
- Icon: 아이콘 표시
- Button: 버튼 (ElevatedButton, TextButton, OutlinedButton)
- FloatingActionButton: 플로팅 버튼
- AppBar: 상단 앱바
- Scaffold: 기본 화면 구조

---

# -------------------------------------------
# 1. Text
# -------------------------------------------

## 1.1 기본 사용법

```dart
Text('안녕하세요')
```

**주요 속성:**
- `style`: TextStyle로 스타일 지정
- `textAlign`: 정렬 (left, center, right, justify)
- `maxLines`: 최대 줄 수
- `overflow`: 넘침 처리 (ellipsis, fade, clip)

## 1.2 TextStyle

```dart
Text(
  '스타일이 있는 텍스트',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  ),
)
```

**TextStyle 속성:**
- `fontSize`: 글자 크기
- `fontWeight`: 굵기 (normal, bold, w100~w900)
- `color`: 색상
- `decoration`: 장식 (underline, lineThrough, overline)

---

# -------------------------------------------
# 2. Icon
# -------------------------------------------

## 2.1 기본 사용법

```dart
Icon(Icons.home)
```

**주요 속성:**
- `icon`: 아이콘 종류 (Icons.xxx)
- `size`: 크기
- `color`: 색상

## 2.2 IconButton

```dart
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {
    // 클릭 이벤트
  },
)
```

**특징:**
- 클릭 가능한 아이콘
- onPressed 필수
- 크기와 색상 커스터마이징 가능

---

# -------------------------------------------
# 3. Image
# -------------------------------------------

## 3.1 Image.asset (로컬 이미지)

```dart
Image.asset('assets/images/photo.png')
```

**사용 전 준비:**
1. `pubspec.yaml`에 assets 추가
2. 이미지 파일을 assets 폴더에 배치

## 3.2 Image.network (네트워크 이미지)

```dart
Image.network('https://example.com/image.jpg')
```

**주요 속성:**
- `width`, `height`: 크기
- `fit`: 맞춤 방식 (BoxFit.cover, BoxFit.contain 등)
- `errorBuilder`: 에러 처리

## 3.3 Image 속성

```dart
Image.asset(
  'assets/image.png',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)
```

---

# -------------------------------------------
# 4. Button
# -------------------------------------------

## 4.1 ElevatedButton

```dart
ElevatedButton(
  onPressed: () {
    // 버튼 클릭 시 실행
  },
  child: Text('버튼'),
)
```

**특징:**
- 입체감 있는 버튼
- 주요 액션에 사용
- Material Design 3 스타일

## 4.2 TextButton

```dart
TextButton(
  onPressed: () {},
  child: Text('텍스트 버튼'),
)
```

**특징:**
- 평면 스타일
- 보조 액션에 사용
- 배경색 없음

## 4.3 OutlinedButton

```dart
OutlinedButton(
  onPressed: () {},
  child: Text('외곽선 버튼'),
)
```

**특징:**
- 외곽선만 있는 버튼
- 중간 중요도 액션에 사용

## 4.4 IconButton

```dart
IconButton(
  icon: Icon(Icons.star),
  onPressed: () {},
)
```

**특징:**
- 아이콘만 있는 버튼
- AppBar의 actions에 자주 사용

## 4.5 ElevatedButton.icon

```dart
ElevatedButton.icon(
  icon: Icon(Icons.download),
  label: Text('다운로드'),
  onPressed: () {},
)
```

**특징:**
- 아이콘과 텍스트 함께
- 명확한 액션 표시

---

# -------------------------------------------
# 5. FloatingActionButton
# -------------------------------------------

## 5.1 기본 사용법

```dart
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)
```

**특징:**
- 화면 우하단에 떠있는 버튼
- 주요 액션에 사용
- Scaffold의 floatingActionButton 속성에 배치

## 5.2 다양한 형태

```dart
// 작은 버튼
FloatingActionButton.small(...)

// 큰 버튼
FloatingActionButton.large(...)

// 확장 버튼
FloatingActionButton.extended(
  label: Text('확장 버튼'),
  icon: Icon(Icons.add),
  onPressed: () {},
)
```

---

# -------------------------------------------
# 6. AppBar
# -------------------------------------------

## 6.1 기본 사용법

```dart
AppBar(
  title: Text('제목'),
)
```

**주요 속성:**
- `title`: 중앙 제목
- `leading`: 왼쪽 위젯 (뒤로가기 버튼 등)
- `actions`: 오른쪽 위젯 리스트
- `backgroundColor`: 배경색
- `elevation`: 그림자 높이

## 6.2 actions 사용

```dart
AppBar(
  title: Text('제목'),
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
  ],
)
```

---

# -------------------------------------------
# 7. Scaffold
# -------------------------------------------

## 7.1 기본 구조

```dart
Scaffold(
  appBar: AppBar(...),
  body: Widget(...),
  floatingActionButton: FloatingActionButton(...),
  drawer: Drawer(...),
  bottomNavigationBar: BottomNavigationBar(...),
)
```

**주요 속성:**
- `appBar`: 상단 앱바
- `body`: 본문 내용
- `floatingActionButton`: 플로팅 버튼
- `drawer`: 사이드 메뉴
- `bottomNavigationBar`: 하단 네비게이션

## 7.2 Scaffold의 역할

- Material Design 앱의 기본 구조 제공
- AppBar, Drawer 등 표준 컴포넌트 배치
- 안전 영역(SafeArea) 자동 처리

---

# -------------------------------------------
# 실전 예제
# -------------------------------------------

## 예제 1: 프로필 카드

```dart
Card(
  child: ListTile(
    leading: CircleAvatar(child: Icon(Icons.person)),
    title: Text('사용자 이름'),
    subtitle: Text('사용자 설명'),
    trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
  ),
)
```

## 예제 2: 액션 버튼 그룹

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
    IconButton(icon: Icon(Icons.comment), onPressed: () {}),
    IconButton(icon: Icon(Icons.share), onPressed: () {}),
  ],
)
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] Text로 텍스트를 표시하고 스타일을 적용할 수 있습니다
- [ ] Icon과 IconButton을 사용할 수 있습니다
- [ ] Image로 이미지를 표시할 수 있습니다
- [ ] ElevatedButton, TextButton, OutlinedButton을 사용할 수 있습니다
- [ ] FloatingActionButton을 사용할 수 있습니다
- [ ] AppBar를 구성할 수 있습니다
- [ ] Scaffold의 구조를 이해했습니다
- [ ] 여러 UI 위젯을 조합할 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F02Ui
flutter run lib/ch03_basic_ui_widgets/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

03단계를 완료했다면 다음 단계로 진행하세요:
- **04단계: 리스트와 그리드** - ListView, GridView, Card

## 전체 커리큘럼

1. 완료 **01단계: 위젯 기초** - StatelessWidget, StatefulWidget
2. 완료 **02단계: 레이아웃 위젯** - Container, Row, Column, Stack
3. 완료 **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar (현재 단계)
4. 다음 **04단계: 리스트와 그리드** - ListView, GridView, Card
5. 다음 **05단계: 네비게이션** - Navigator, Routes
6. 다음 **06단계: 폼과 입력** - TextField, Form, Checkbox
7. 다음 **07단계: 테마와 스타일링** - ThemeData, ColorScheme
8. 다음 **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **버튼 선택 가이드**
   - 주요 액션: ElevatedButton
   - 보조 액션: TextButton
   - 중간 중요도: OutlinedButton
   - 아이콘만: IconButton

2. **이미지 사용**
   - 로컬 이미지: Image.asset (pubspec.yaml 설정 필요)
   - 네트워크 이미지: Image.network
   - 에러 처리: errorBuilder 사용

3. **AppBar 활용**
   - leading: 뒤로가기 버튼 (자동 생성)
   - actions: 검색, 메뉴 등
   - title: 화면 제목

4. **실전 활용**
   - Scaffold는 거의 모든 화면의 루트
   - AppBar는 일관된 네비게이션 제공
   - FloatingActionButton은 주요 액션에 사용

