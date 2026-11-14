import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01단계: 위젯 기초',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WidgetBasicsPage(),
    );
  }
}

class WidgetBasicsPage extends StatefulWidget {
  const WidgetBasicsPage({super.key});

  @override
  State<WidgetBasicsPage> createState() => _WidgetBasicsPageState();
}

class _WidgetBasicsPageState extends State<WidgetBasicsPage> {
  int _counter = 0;
  int _buildCount = 0;
  String _message = '안녕하세요!';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeMessage() {
    setState(() {
      _message = _message == '안녕하세요!' ? '반갑습니다!' : '안녕하세요!';
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() 호출 횟수를 보여주기 위한 교육용 코드입니다
    // (원래 build()는 순수해야 하지만 여기선 호출 횟수 확인을 위해 사용)
    _buildCount++;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01단계: 위젯 기초'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================================
            // 1. StatelessWidget 예제
            // ============================================
            _buildSection(
              title: '1. StatelessWidget (정적 위젯)',
              child: Column(
                children: [
                  const StaticWidget(
                    title: '정적 위젯 예제',
                    description: '이 위젯은 상태가 없습니다.',
                  ),
                  const SizedBox(height: 16),
                  const StaticWidget(
                    title: '또 다른 정적 위젯',
                    description: '항상 같은 내용을 표시합니다.',
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // ============================================
            // 2. StatefulWidget 예제
            // ============================================
            _buildSection(
              title: '2. StatefulWidget (상태를 가진 위젯)',
              child: Column(
                children: [
                  // 카운터 예제
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
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
                        const SizedBox(height: 8),
                        Text(
                          '$_counter',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _incrementCounter,
                          child: const Text('증가'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 메시지 변경 예제
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
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
                        const SizedBox(height: 8),
                        Text(
                          _message,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _changeMessage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('메시지 변경'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // ============================================
            // 3. 위젯 트리 구조
            // ============================================
            _buildSection(
              title: '3. 위젯 트리 구조',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.purple.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '위젯 계층 구조:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildWidgetTree(),
                  ],
                ),
              ),
            ),

            const Divider(height: 40),

            // ============================================
            // 4. build() 메서드
            // ============================================
            _buildSection(
              title: '4. build() 메서드',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'build() 메서드 특징:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('• 위젯을 반환합니다'),
                    Text('• setState() 호출 시 자동 실행됩니다'),
                    Text('• 빠르게 실행되어야 합니다'),
                    Text('• 순수 함수처럼 동작해야 합니다'),
                  ],
                ),
              ),
            ),

            const Divider(height: 40),

            // ============================================
            // 5. setState() 동작 원리
            // ============================================
            _buildSection(
              title: '5. setState() 동작 원리',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'setState() 호출 시:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('1. 상태가 변경됩니다'),
                    const Text('2. build() 메서드가 호출됩니다'),
                    const Text('3. UI가 다시 그려집니다'),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '현재 카운터: $_counter\nbuild() 호출 횟수: $_buildCount',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
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
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildWidgetTree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTreeItem('MaterialApp', Colors.blue),
        _buildTreeItem('  └─ Scaffold', Colors.green, indent: 4),
        _buildTreeItem('      ├─ AppBar', Colors.orange, indent: 6),
        _buildTreeItem('      └─ Body', Colors.purple, indent: 6),
        _buildTreeItem('          └─ Column', Colors.red, indent: 10),
        _buildTreeItem('              └─ 여러 위젯들...', Colors.grey, indent: 14),
      ],
    );
  }

  Widget _buildTreeItem(String text, Color color, {int indent = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: indent.toDouble()),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontFamily: 'monospace',
          fontSize: 12,
        ),
      ),
    );
  }
}

// StatelessWidget 예제
class StaticWidget extends StatelessWidget {
  final String title;
  final String description;

  const StaticWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

