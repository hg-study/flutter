# ch05-02: Named Routes - 코드 설명

##  학습 목표
- Named Routes 사용법
- routes 설정
- Navigator.pushNamed 사용

---

##  중요 코드 설명

### 1. routes 설정

```dart
MaterialApp(
  routes: {
    '/second': (context) => SecondPage(),
    '/third': (context) => ThirdPage(),
  },
)
```

**핵심 포인트:**
- `routes`: 경로와 페이지 매핑
- 문자열 경로 사용

### 2. Navigator.pushNamed

```dart
Navigator.pushNamed(context, '/second');
```

**핵심 포인트:**
- 경로 이름으로 페이지 이동
- 코드가 간결해짐

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] routes를 설정할 수 있습니다
- [ ] Navigator.pushNamed를 사용할 수 있습니다

---

##  실행 방법

```bash
cd F02Ui
flutter run lib/ch05_navigation/ch05-02_named_routes.dart
```

