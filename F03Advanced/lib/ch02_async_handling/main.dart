import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02단계: 비동기 처리',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AsyncProcessingPage(),
    );
  }
}

class AsyncProcessingPage extends StatefulWidget {
  const AsyncProcessingPage({super.key});

  @override
  State<AsyncProcessingPage> createState() => _AsyncProcessingPageState();
}

class _AsyncProcessingPageState extends State<AsyncProcessingPage> {
  // ⚠️ 중요: 왜 build 안에서 Future/Stream을 만들면 안 되는가?
  // build()는 setState, 화면 회전 등으로 언제든 다시 실행됩니다.
  // future: _fetchData()처럼 build 안에서 직접 호출하면
  // 리빌드될 때마다 Future/Stream이 새로 만들어져 비동기 작업이 반복 실행됩니다.
  // → 해결: initState()에서 한 번만 만들어 변수에 저장해 둡니다.
  late final Future<String> _fetchFuture;
  late final Future<int> _sumFuture;
  late final Stream<int> _numberStreamInstance;

  @override
  void initState() {
    super.initState();
    _fetchFuture = _fetchData(); // 한 번만 실행
    _sumFuture = _calculateSum(); // 한 번만 실행
    _numberStreamInstance = _numberStream(); // 한 번만 생성
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02단계: 비동기 처리'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: '1. FutureBuilder 기본',
              child: FutureBuilder<String>(
                // initState에서 만들어 둔 Future를 사용합니다.
                future: _fetchFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  
                  if (snapshot.hasError) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 40),
                          const SizedBox(height: 8),
                          Text('에러: ${snapshot.error}'),
                        ],
                      ),
                    );
                  }
                  
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Column(
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
            const Divider(height: 40),
            _buildSection(
              title: '2. FutureBuilder 상태 처리',
              child: FutureBuilder<int>(
                // initState에서 만들어 둔 Future를 사용합니다.
                future: _sumFuture,
                builder: (context, snapshot) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '상태: ${_getConnectionStateText(snapshot.connectionState)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        if (snapshot.connectionState == ConnectionState.waiting)
                          const LinearProgressIndicator()
                        else if (snapshot.hasData)
                          Text('결과: ${snapshot.data}')
                        else if (snapshot.hasError)
                          Text('에러: ${snapshot.error}', style: const TextStyle(color: Colors.red)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '3. StreamBuilder 기본',
              child: StreamBuilder<int>(
                // initState에서 만들어 둔 Stream을 사용합니다.
                stream: _numberStreamInstance,
                builder: (context, snapshot) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.purple.shade200),
                    ),
                    child: Column(
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
            const Divider(height: 40),
            _buildSection(
              title: '4. 실전 예제: 타이머',
              child: const TimerExample(),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '5. 실전 예제: 데이터 로딩',
              child: const DataLoadingExample(),
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

  // 시뮬레이션: 데이터 가져오기
  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return '데이터 로드 완료!';
  }

  // 시뮬레이션: 계산 수행
  Future<int> _calculateSum() async {
    await Future.delayed(const Duration(seconds: 1));
    return 1 + 2 + 3 + 4 + 5;
  }

  // 시뮬레이션: 숫자 스트림
  Stream<int> _numberStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield i;
    }
  }
}

// 타이머 예제
class TimerExample extends StatefulWidget {
  const TimerExample({super.key});

  @override
  State<TimerExample> createState() => _TimerExampleState();
}

class _TimerExampleState extends State<TimerExample> {
  StreamController<int>? _controller;
  Stream<int>? _stream;
  int _seconds = 0;
  // Timer를 변수에 저장해 두어야 dispose()에서 취소할 수 있습니다.
  // 취소하지 않으면 화면이 사라진 뒤에도 타이머가 계속 돌아서
  // 닫힌 StreamController에 add()를 시도하다 에러가 납니다.
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<int>();
    _stream = _controller!.stream;
  }

  @override
  void dispose() {
    _timer?.cancel(); // 타이머 먼저 취소
    _controller?.close();
    super.dispose();
  }

  void _startTimer() {
    _seconds = 0;
    _timer?.cancel(); // 이미 돌고 있는 타이머가 있으면 취소 (중복 실행 방지)
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds < 10) {
        _seconds++;
        _controller?.add(_seconds);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        children: [
          StreamBuilder<int>(
            stream: _stream,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text(
                    snapshot.hasData ? '${snapshot.data}' : '0',
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '초',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _startTimer,
            child: const Text('타이머 시작'),
          ),
        ],
      ),
    );
  }
}

// 데이터 로딩 예제
class DataLoadingExample extends StatefulWidget {
  const DataLoadingExample({super.key});

  @override
  State<DataLoadingExample> createState() => _DataLoadingExampleState();
}

class _DataLoadingExampleState extends State<DataLoadingExample> {
  // Future는 initState에서 한 번만 만들어 저장합니다.
  // (새로고침 버튼을 누를 때만 setState와 함께 새로 만듭니다)
  late Future<List<String>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = _loadData(); // 한 번만 실행
  }

  Future<List<String>> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    return ['항목 1', '항목 2', '항목 3', '항목 4', '항목 5'];
  }

  void _refresh() {
    setState(() {
      _dataFuture = _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '데이터 목록',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _refresh,
              ),
            ],
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<String>>(
            future: _dataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 40),
                      const SizedBox(height: 8),
                      Text('에러: ${snapshot.error}'),
                    ],
                  ),
                );
              }
              
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data!.map((item) {
                    return ListTile(
                      leading: const Icon(Icons.check_circle, color: Colors.teal),
                      title: Text(item),
                    );
                  }).toList(),
                );
              }
              
              return const Text('데이터 없음');
            },
          ),
        ],
      ),
    );
  }
}

