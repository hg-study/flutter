import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-02: FutureBuilder 상태 처리',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FutureBuilderStatesPage(),
    );
  }
}

class FutureBuilderStatesPage extends StatefulWidget {
  const FutureBuilderStatesPage({super.key});

  @override
  State<FutureBuilderStatesPage> createState() =>
      _FutureBuilderStatesPageState();
}

class _FutureBuilderStatesPageState extends State<FutureBuilderStatesPage> {
  // ⚠️ 중요: 왜 build 안에서 Future를 만들면 안 되는가?
  // build()는 리빌드될 때마다 다시 실행되므로,
  // future: _calculateSum()처럼 build 안에서 직접 호출하면
  // 리빌드마다 계산이 처음부터 다시 실행됩니다.
  // → 해결: initState()에서 한 번만 만들어 변수에 저장합니다.
  late final Future<int> _future;

  @override
  void initState() {
    super.initState();
    _future = _calculateSum(); // 한 번만 실행
  }

  // 시뮬레이션: 계산 수행
  Future<int> _calculateSum() async {
    await Future.delayed(const Duration(seconds: 1));
    return 1 + 2 + 3 + 4 + 5;
  }

  String _getConnectionStateText(ConnectionState state) {
    switch (state) {
      case ConnectionState.none:
        return '없음';
      case ConnectionState.waiting:
        return '대기 중';
      case ConnectionState.active:
        return '활성';
      case ConnectionState.done:
        return '완료';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02-02: FutureBuilder 상태 처리'),
      ),
      body: Center(
        child: FutureBuilder<int>(
          // initState에서 만들어 둔 _future를 사용합니다.
          future: _future,
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '상태: ${_getConnectionStateText(snapshot.connectionState)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  if (snapshot.connectionState == ConnectionState.waiting)
                    const LinearProgressIndicator()
                  else if (snapshot.hasData)
                    Text(
                      '결과: ${snapshot.data}',
                      style: const TextStyle(fontSize: 18),
                    )
                  else if (snapshot.hasError)
                    Text(
                      '에러: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
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

