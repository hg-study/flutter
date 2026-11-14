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
      title: '01-03: Provider.of',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProviderOfPage(),
    );
  }
}

// Provider: 상태 관리 클래스
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ProviderOfPage extends StatelessWidget {
  const ProviderOfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01-03: Provider.of'),
      ),
      body: Center(
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
                mainAxisSize: MainAxisSize.min,
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
                      // listen: false의 의미:
                      // "이 호출 지점(버튼 콜백)은 상태 변화를 구독하지 않는다"는 뜻입니다.
                      // onPressed 같은 콜백 안에서는 build가 아니므로 listen: false가 필수입니다.
                      // 위의 Text는 Provider.of(context)로 구독 중이므로
                      // increment() 후에도 화면의 숫자는 정상적으로 업데이트됩니다!
                      // 참고: 요즘은 context.read<CounterProvider>() (= listen: false),
                      // context.watch<CounterProvider>() (= listen: true)를 더 많이 씁니다.
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
    );
  }
}

