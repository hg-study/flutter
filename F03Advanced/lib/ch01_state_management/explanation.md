# -------------------------------------------
# 01단계: 상태 관리 (Provider)
# -------------------------------------------

## 학습 목표

이 단계에서는 Flutter의 상태 관리 패턴인 Provider를 학습합니다:
- Provider 패턴 이해
- ChangeNotifier 사용
- Consumer 위젯
- Provider.of 사용
- 실전 예제 (할 일 목록)

---

# -------------------------------------------
# 1. 상태 관리란?
# -------------------------------------------

## 1.1 문제 상황

**setState()의 한계:**
- 위젯 간 상태 공유 어려움
- 깊은 위젯 트리에서 상태 전달 복잡
- 불필요한 rebuild 발생

**해결책: Provider**
- 상태와 UI 분리
- 여러 위젯에서 상태 공유
- 효율적인 상태 업데이트

## 1.2 Provider의 장점

- 간단한 API
- 효율적인 rebuild
- 테스트 용이
- Flutter 팀 공식 추천

---

# -------------------------------------------
# 2. Provider 기본 사용법
# -------------------------------------------

## 2.1 패키지 추가

`pubspec.yaml`에 추가:
```yaml
dependencies:
  provider: ^6.1.1
```

설치:
```bash
flutter pub get
```

## 2.2 ChangeNotifier 생성

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners(); // UI 업데이트 알림
  }
}
```

**핵심:**
- ChangeNotifier 상속
- notifyListeners() 호출로 UI 업데이트

## 2.3 Provider 등록

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    ),
  );
}
```

---

# -------------------------------------------
# 3. Consumer 위젯
# -------------------------------------------

## 3.1 기본 사용법

```dart
Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Text('${provider.count}');
  },
)
```

**특징:**
- provider 변경 시 자동 rebuild
- 필요한 위젯만 업데이트
- 성능 최적화

## 3.2 child 활용

```dart
Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Column(
      children: [
        child!, // rebuild 되지 않음
        Text('${provider.count}'),
      ],
    );
  },
  child: ExpensiveWidget(), // 한 번만 생성
)
```

---

# -------------------------------------------
# 4. Provider.of
# -------------------------------------------

## 4.1 기본 사용법

```dart
final provider = Provider.of<CounterProvider>(context);
provider.increment();
```

## 4.2 listen: false

```dart
Provider.of<CounterProvider>(context, listen: false)
    .increment();
```

**사용 시나리오:**
- 상태 변경만 필요할 때
- rebuild 불필요할 때
- 버튼 클릭 등 이벤트 핸들러

---

# -------------------------------------------
# 5. 여러 Provider 사용
# -------------------------------------------

## 5.1 MultiProvider

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
    ChangeNotifierProvider(create: (_) => TodoProvider()),
  ],
  child: MyApp(),
)
```

## 5.2 Provider 조합

```dart
Consumer2<CounterProvider, TodoProvider>(
  builder: (context, counter, todo, child) {
    return Column(
      children: [
        Text('${counter.count}'),
        Text('${todo.todos.length}'),
      ],
    );
  },
)
```

---

# -------------------------------------------
# 6. 실전 예제: 할 일 목록
# -------------------------------------------

## 6.1 TodoProvider

```dart
class TodoProvider extends ChangeNotifier {
  final List<TodoItem> _todos = [];
  
  List<TodoItem> get todos => _todos;
  
  void addTodo(String title) {
    _todos.add(TodoItem(title: title));
    notifyListeners();
  }
  
  void toggleTodo(int index) {
    _todos[index].completed = !_todos[index].completed;
    notifyListeners();
  }
}
```

## 6.2 UI에서 사용

```dart
Consumer<TodoProvider>(
  builder: (context, provider, child) {
    return ListView.builder(
      itemCount: provider.todos.length,
      itemBuilder: (context, index) {
        final todo = provider.todos[index];
        return ListTile(
          title: Text(todo.title),
          leading: Checkbox(
            value: todo.completed,
            onChanged: (_) => provider.toggleTodo(index),
          ),
        );
      },
    );
  },
)
```

---

# -------------------------------------------
# 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] Provider 패키지를 추가할 수 있습니다
- [ ] ChangeNotifier를 만들 수 있습니다
- [ ] ChangeNotifierProvider로 등록할 수 있습니다
- [ ] Consumer로 상태를 사용할 수 있습니다
- [ ] Provider.of로 상태에 접근할 수 있습니다
- [ ] notifyListeners()를 이해했습니다
- [ ] 실전 예제를 만들 수 있습니다

---

# -------------------------------------------
# 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [run.md](run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd F03Advanced
flutter pub get
flutter run lib/ch01_state_management/main.dart
```

---

# -------------------------------------------
# 다음 단계
# -------------------------------------------

01단계를 완료했다면 다음 단계로 진행하세요:
- **02단계: 비동기 처리** - FutureBuilder, StreamBuilder

## 전체 커리큘럼

1. 완료 **01단계: 상태 관리** - Provider (현재 단계)
2. 다음 **02단계: 비동기 처리** - FutureBuilder, StreamBuilder
3. 다음 **03단계: 로컬 저장소** - SharedPreferences, File I/O
4. 다음 **04단계: 이미지 & 미디어** - image_picker
5. 다음 **05단계: 외부 패키지 사용** - http 등

---

# -------------------------------------------
# 팁
# -------------------------------------------

1. **Provider 선택 가이드**
   - 간단한 앱: Provider
   - 복잡한 앱: Riverpod, BLoC
   - 상태 관리 패턴 이해 후 선택

2. **성능 최적화**
   - Consumer로 필요한 부분만 rebuild
   - child 활용
   - listen: false 적절히 사용

3. **실전 활용**
   - 전역 상태: 앱 최상위에 Provider
   - 지역 상태: 필요한 부분만 Provider
   - 상태 분리: 각 기능별 Provider

4. **주의사항**
   - notifyListeners() 필수
   - 불필요한 rebuild 방지
   - 메모리 누수 주의

