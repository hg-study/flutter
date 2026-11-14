# -------------------------------------------
# 05단계: 네비게이션
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 네비게이션을 학습합니다:
- Navigator: 화면 전환
- Routes: 라우트 정의
- MaterialPageRoute: 페이지 라우트
- Named Routes: 이름 있는 라우트
- BottomNavigationBar: 하단 네비게이션
- Drawer: 사이드 메뉴

---

# -------------------------------------------
# 1. Navigator 기본
# -------------------------------------------

## 1.1 Navigator.push (화면 이동)

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondPage(),
  ),
);
```

**동작:**
- 새 화면을 스택에 추가
- 뒤로가기 버튼으로 이전 화면으로 복귀
- 애니메이션 효과

## 1.2 Navigator.pop (뒤로가기)

```dart
Navigator.pop(context);
```

**동작:**
- 현재 화면을 스택에서 제거
- 이전 화면으로 복귀

---

# -------------------------------------------
# 2. MaterialPageRoute
# -------------------------------------------

## 2.1 기본 사용법

```dart
MaterialPageRoute(
  builder: (context) => SecondPage(),
)
```

**특징:**
- Material Design 전환 애니메이션
- 기본 라우트 타입
- Android/iOS 스타일 자동 적용

## 2.2 커스텀 설정

```dart
MaterialPageRoute(
  builder: (context) => SecondPage(),
  settings: RouteSettings(name: '/second'),
  fullscreenDialog: true,
)
```

---

# -------------------------------------------
# 3. Named Routes
# -------------------------------------------

## 3.1 라우트 정의

```dart
MaterialApp(
  routes: {
    '/second': (context) => SecondPage(),
    '/third': (context) => ThirdPage(),
  },
)
```

## 3.2 라우트 사용

```dart
Navigator.pushNamed(context, '/second');
```

**장점:**
- 라우트 중앙 관리
- 재사용 가능
- 유지보수 용이

---

# -------------------------------------------
# 4. 데이터 전달
# -------------------------------------------

## 4.1 생성자로 전달

```dart
// 이동
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(data: '전달할 데이터'),
  ),
);

// 받기
class DetailPage extends StatelessWidget {
  final String data;
  
  const DetailPage({super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
```

## 4.2 arguments로 전달

```dart
// 이동
Navigator.pushNamed(
  context,
  '/detail',
  arguments: {'id': 1, 'name': '이름'},
);

// 받기
final args = ModalRoute.of(context)!.settings.arguments as Map;
```

---

# -------------------------------------------
# 5. 결과 받기
# -------------------------------------------

## 5.1 결과 반환

```dart
// 결과 페이지에서
Navigator.pop(context, '결과 데이터');
```

## 5.2 결과 받기

```dart
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ResultPage()),
);

print('받은 결과: $result');
```

**특징:**
- async/await 사용
- Future 반환
- null 가능

---

# -------------------------------------------
# 6. BottomNavigationBar
# -------------------------------------------

## 6.1 기본 사용법

```dart
BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
  ],
)
```

**특징:**
- 하단에 고정
- 여러 탭 전환
- 아이콘과 라벨

---

# -------------------------------------------
# 7. Drawer
# -------------------------------------------

## 7.1 기본 사용법

```dart
Scaffold(
  drawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Text('메뉴'),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('홈'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
)
```

**특징:**
- 왼쪽에서 슬라이드
- AppBar의 햄버거 메뉴로 열기
- ListTile로 메뉴 구성

---

# -------------------------------------------
# 실전 예제
# -------------------------------------------

## 예제 1: 탭 네비게이션

```dart
class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [...],
      ),
    );
  }
}
```

## 예제 2: 상세 페이지로 이동

```dart
// 리스트에서
ListTile(
  title: Text(item.name),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(item: item),
      ),
    );
  },
)
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] Navigator.push로 화면을 이동할 수 있습니다
- [ ] Navigator.pop으로 뒤로가기를 할 수 있습니다
- [ ] Named Routes를 사용할 수 있습니다
- [ ] 데이터를 전달할 수 있습니다
- [ ] 결과를 받아올 수 있습니다
- [ ] BottomNavigationBar를 사용할 수 있습니다
- [ ] Drawer를 사용할 수 있습니다
- [ ] 여러 화면을 연결할 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F02Ui
flutter run lib/ch05_navigation/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

05단계를 완료했다면 다음 단계로 진행하세요:
- **06단계: 폼과 입력** - TextField, Form, Checkbox

## 전체 커리큘럼

1. 완료 **01단계: 위젯 기초** - StatelessWidget, StatefulWidget
2. 완료 **02단계: 레이아웃 위젯** - Container, Row, Column, Stack
3. 완료 **03단계: 기본 UI 위젯** - Text, Image, Button, AppBar
4. 완료 **04단계: 리스트와 그리드** - ListView, GridView, Card
5. 완료 **05단계: 네비게이션** - Navigator, Routes (현재 단계)
6. 다음 **06단계: 폼과 입력** - TextField, Form, Checkbox
7. 다음 **07단계: 테마와 스타일링** - ThemeData, ColorScheme
8. 다음 **08단계: 고급 레이아웃** - Wrap, Flexible, SafeArea

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **네비게이션 스택**
   - LIFO (Last In First Out)
   - push로 추가, pop으로 제거
   - 스택 구조 이해 중요

2. **Named Routes vs 직접 라우트**
   - 간단한 앱: 직접 라우트
   - 복잡한 앱: Named Routes
   - 재사용성 고려

3. **데이터 전달 방법**
   - 생성자: 타입 안전, 명확
   - arguments: 유연하지만 타입 체크 없음
   - 상황에 맞게 선택

4. **실전 활용**
   - BottomNavigationBar: 주요 화면 전환
   - Drawer: 메뉴, 설정
   - Navigator: 상세 페이지, 모달

