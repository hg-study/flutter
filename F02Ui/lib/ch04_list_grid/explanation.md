# -------------------------------------------
# 04단계: 리스트와 그리드
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 리스트와 그리드를 학습합니다:
- ListView: 스크롤 가능한 리스트
- ListView.builder: 동적 리스트
- GridView: 그리드 레이아웃
- Card: 카드 위젯
- ListTile: 리스트 아이템

---

# -------------------------------------------
# 1. ListView
# -------------------------------------------

## 1.1 기본 ListView

```dart
ListView(
  children: [
    ListTile(title: Text('항목 1')),
    ListTile(title: Text('항목 2')),
    ListTile(title: Text('항목 3')),
  ],
)
```

**특징:**
- 모든 자식을 한 번에 생성
- 적은 수의 항목에 적합
- 스크롤 자동 지원

## 1.2 ListView.builder

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(items[index]));
  },
)
```

**특징:**
- 필요한 항목만 생성 (지연 로딩)
- 많은 수의 항목에 적합
- 성능 최적화

## 1.3 ListView.separated

```dart
ListView.separated(
  itemCount: items.length,
  separatorBuilder: (context, index) => Divider(),
  itemBuilder: (context, index) {
    return ListTile(title: Text(items[index]));
  },
)
```

**특징:**
- 항목 사이에 구분선 자동 추가
- separatorBuilder로 커스텀 구분선

---

# -------------------------------------------
# 2. ListTile
# -------------------------------------------

## 2.1 기본 ListTile

```dart
ListTile(
  leading: Icon(Icons.star),
  title: Text('제목'),
  subtitle: Text('부제목'),
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)
```

**주요 속성:**
- `leading`: 왼쪽 위젯 (아이콘, 아바타 등)
- `title`: 제목
- `subtitle`: 부제목
- `trailing`: 오른쪽 위젯
- `onTap`: 탭 이벤트

## 2.2 ListTile 활용

```dart
ListTile(
  leading: CircleAvatar(child: Icon(Icons.person)),
  title: Text('사용자 이름'),
  subtitle: Text('사용자 설명'),
  isThreeLine: true,
  dense: true,
  onTap: () {},
)
```

---

# -------------------------------------------
# 3. GridView
# -------------------------------------------

## 3.1 GridView.builder

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
  ),
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Container(color: Colors.blue);
  },
)
```

**SliverGridDelegateWithFixedCrossAxisCount 속성:**
- `crossAxisCount`: 열 개수
- `crossAxisSpacing`: 열 간격
- `mainAxisSpacing`: 행 간격
- `childAspectRatio`: 자식 비율

## 3.2 GridView.count

```dart
GridView.count(
  crossAxisCount: 3,
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
)
```

**특징:**
- 간단한 그리드
- 적은 수의 항목에 적합

---

# -------------------------------------------
# 4. Card
# -------------------------------------------

## 4.1 기본 Card

```dart
Card(
  child: ListTile(
    title: Text('제목'),
    subtitle: Text('부제목'),
  ),
)
```

**주요 속성:**
- `elevation`: 그림자 높이
- `shape`: 모양 (RoundedRectangleBorder 등)
- `color`: 배경색
- `child`: 자식 위젯

## 4.2 복잡한 Card

```dart
Card(
  elevation: 4,
  child: Column(
    children: [
      Image.asset('assets/image.png'),
      Padding(
        padding: EdgeInsets.all(16),
        child: Text('내용'),
      ),
    ],
  ),
)
```

---

# -------------------------------------------
# 실전 예제
# -------------------------------------------

## 예제 1: 상품 목록

```dart
ListView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        leading: Image.network(products[index].imageUrl),
        title: Text(products[index].name),
        subtitle: Text('${products[index].price}원'),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
    );
  },
)
```

## 예제 2: 이미지 그리드

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  ),
  itemCount: images.length,
  itemBuilder: (context, index) {
    return Image.network(images[index]);
  },
)
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] ListView로 리스트를 만들 수 있습니다
- [ ] ListView.builder로 동적 리스트를 만들 수 있습니다
- [ ] ListView.separated로 구분선이 있는 리스트를 만들 수 있습니다
- [ ] ListTile을 사용할 수 있습니다
- [ ] GridView로 그리드를 만들 수 있습니다
- [ ] Card를 사용할 수 있습니다
- [ ] 리스트와 그리드를 조합할 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F02Ui
flutter run lib/ch04_list_grid/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

04단계를 완료했다면 다음 단계로 진행하세요:
- **05단계: 네비게이션** - Navigator, Routes

## 전체 커리큘럼

1. 완료 **01단계: 위젯 기초** - StatelessWidget, StatefulWidget
2. 완료 **02단계: 레이아웃 위젯** - Container, Row, Column, Stack
3. 완료 **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar
4. 완료 **04단계: 리스트와 그리드** - ListView, GridView, Card (현재 단계)
5. 다음 **05단계: 네비게이션** - Navigator, Routes
6. 다음 **06단계: 폼과 입력** - TextField, Form, Checkbox
7. 다음 **07단계: 테마와 스타일링** - ThemeData, ColorScheme
8. 다음 **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **ListView 선택 가이드**
   - 적은 항목: ListView
   - 많은 항목: ListView.builder
   - 구분선 필요: ListView.separated

2. **성능 최적화**
   - ListView.builder 사용
   - itemExtent 설정 (고정 높이)
   - 불필요한 rebuild 방지

3. **GridView 활용**
   - 상품 목록
   - 이미지 갤러리
   - 대시보드

4. **Card 활용**
   - 정보 카드
   - 프로필 카드
   - 설정 항목

