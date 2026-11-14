import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-03: StreamBuilder 기본',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StreamBuilderBasicPage(),
    );
  }
}

class StreamBuilderBasicPage extends StatefulWidget {
  const StreamBuilderBasicPage({super.key});

  @override
  State<StreamBuilderBasicPage> createState() => _StreamBuilderBasicPageState();
}

class _StreamBuilderBasicPageState extends State<StreamBuilderBasicPage> {
  // ⚠️ 중요: 왜 build 안에서 Stream을 만들면 안 되는가?
  // build()는 리빌드될 때마다 다시 실행되므로,
  // stream: _numberStream()처럼 build 안에서 직접 호출하면
  // 리빌드마다 새 스트림이 만들어져 숫자가 1부터 다시 시작됩니다.
  // → 해결: initState()에서 한 번만 만들어 변수에 저장합니다.
  late final Stream<int> _stream;

  @override
  void initState() {
    super.initState();
    _stream = _numberStream(); // 한 번만 생성
  }

  // 시뮬레이션: 숫자 스트림
  Stream<int> _numberStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield i;
    }
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
        title: const Text('02-03: StreamBuilder 기본'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          // initState에서 만들어 둔 _stream을 사용합니다.
          stream: _stream,
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '스트림 데이터',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  if (snapshot.hasData)
                    Text(
                      '${snapshot.data}',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    )
                  else
                    const Text('데이터 대기 중...'),
                  const SizedBox(height: 16),
                  Text(
                    '상태: ${_getConnectionStateText(snapshot.connectionState)}',
                    style: TextStyle(color: Colors.grey.shade600),
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

