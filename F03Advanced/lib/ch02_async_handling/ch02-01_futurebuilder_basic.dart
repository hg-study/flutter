import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-01: FutureBuilder 기본',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FutureBuilderBasicPage(),
    );
  }
}

class FutureBuilderBasicPage extends StatefulWidget {
  const FutureBuilderBasicPage({super.key});

  @override
  State<FutureBuilderBasicPage> createState() => _FutureBuilderBasicPageState();
}

class _FutureBuilderBasicPageState extends State<FutureBuilderBasicPage> {
  // ⚠️ 중요: 왜 build 안에서 Future를 만들면 안 되는가?
  // build()는 setState, 화면 회전, 키보드 표시 등으로 언제든 다시 실행됩니다.
  // build 안에서 future: _fetchData()처럼 직접 호출하면
  // 리빌드될 때마다 Future가 새로 만들어져 비동기 작업이 반복 실행됩니다.
  // (네트워크 요청이라면 요청이 계속 다시 날아가는 버그!)
  // → 해결: Future를 initState()에서 한 번만 만들어 변수에 저장해 둡니다.
  late final Future<String> _future;

  @override
  void initState() {
    super.initState();
    _future = _fetchData(); // 한 번만 실행
  }

  // 시뮬레이션: 데이터 가져오기
  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return '데이터 로드 완료!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02-01: FutureBuilder 기본'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          // build 안에서 _fetchData()를 직접 호출하지 않고,
          // initState에서 만들어 둔 _future를 사용합니다.
          future: _future,
          builder: (context, snapshot) {
            // 로딩 중
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('데이터 로딩 중...'),
                ],
              );
            }

            // 에러 발생
            if (snapshot.hasError) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 40),
                    const SizedBox(height: 8),
                    Text('에러: ${snapshot.error}'),
                  ],
                ),
              );
            }

            // 데이터 로드 완료
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    '데이터: ${snapshot.data}',
                    style: const TextStyle(fontSize: 16),
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

