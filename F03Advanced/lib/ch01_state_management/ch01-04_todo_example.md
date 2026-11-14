# ch01-04: 할 일 목록 예제 - 코드 설명

##  학습 목표
- 실전 Provider 사용 예제
- 리스트 상태 관리
- CRUD 작업 구현

---

##  중요 코드 설명

### 리스트 상태 관리

```dart
class TodoProvider extends ChangeNotifier {
  final List<TodoItem> _todos = [];
  
  void addTodo(String title) {
    _todos.add(TodoItem(...));
    notifyListeners();
  }
  
  void toggleTodo(int index) {
    _todos[index].completed = !_todos[index].completed;
    notifyListeners();
  }
}
```

**핵심 포인트:**
- 리스트 상태 관리
- 추가, 수정, 삭제 작업

---

##  체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 리스트 상태를 관리할 수 있습니다
- [ ] CRUD 작업을 구현할 수 있습니다

---

##  실행 방법

```bash
cd F03Advanced
flutter run lib/ch01_state_management/ch01-04_todo_example.dart
```

