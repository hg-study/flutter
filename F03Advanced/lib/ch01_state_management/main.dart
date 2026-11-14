import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01단계: 상태 관리',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StateManagementPage(),
    );
  }
}

// Provider: 상태 관리 클래스
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  String _message = '안녕하세요!';

  int get count => _count;
  String get message => _message;

  void increment() {
    _count++;
    notifyListeners(); // UI 업데이트 알림
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void changeMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01단계: 상태 관리'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: '1. Provider 기본 사용',
              child: Consumer<CounterProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              '카운터',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${provider.count}',
                              style: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: provider.decrement,
                                  child: const Text('-'),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: provider.reset,
                                  child: const Text('리셋'),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: provider.increment,
                                  child: const Text('+'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '2. 여러 상태 관리',
              child: Consumer<CounterProvider>(
                builder: (context, provider, child) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '메시지',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          provider.message,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: [
                            ElevatedButton(
                              onPressed: () => provider.changeMessage('안녕하세요!'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('메시지 1'),
                            ),
                            ElevatedButton(
                              onPressed: () => provider.changeMessage('반갑습니다!'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('메시지 2'),
                            ),
                            ElevatedButton(
                              onPressed: () => provider.changeMessage('좋은 하루!'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('메시지 3'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '3. Provider.of 사용',
              child: Builder(
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange.shade200),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Provider.of 예제',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '현재 카운터: ${Provider.of<CounterProvider>(context).count}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<CounterProvider>(context, listen: false)
                                .increment();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('증가 (listen: false)'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '4. 실전 예제: 할 일 목록',
              child: const TodoListExample(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}

// 할 일 목록 예제
class TodoProvider extends ChangeNotifier {
  final List<TodoItem> _todos = [];

  List<TodoItem> get todos => _todos;

  void addTodo(String title) {
    _todos.add(TodoItem(title: title, completed: false));
    notifyListeners();
  }

  void toggleTodo(int index) {
    _todos[index].completed = !_todos[index].completed;
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}

class TodoItem {
  final String title;
  bool completed;

  TodoItem({required this.title, required this.completed});
}

class TodoListExample extends StatelessWidget {
  const TodoListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.purple.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.purple.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '할 일 목록',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Consumer<TodoProvider>(
              builder: (context, provider, child) {
                if (provider.todos.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('할 일이 없습니다'),
                    ),
                  );
                }
                return Column(
                  children: List.generate(
                    provider.todos.length,
                    (index) {
                      final todo = provider.todos[index];
                      return ListTile(
                        leading: Checkbox(
                          value: todo.completed,
                          onChanged: (_) => provider.toggleTodo(index),
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.completed
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => provider.removeTodo(index),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<TodoProvider>(
              builder: (context, provider, child) {
                return ElevatedButton.icon(
                  onPressed: () {
                    // 예제 단순화를 위해 다이얼로그용 컨트롤러를 여기서 생성.
                    // 실제 앱에서는 dispose로 정리가 필요합니다.
                    final controller = TextEditingController();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('할 일 추가'),
                        content: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: '할 일을 입력하세요',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('취소'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                provider.addTodo(controller.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('추가'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('할 일 추가'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

