import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02단계: 레이아웃 위젯',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LayoutWidgetsPage(),
    );
  }
}

class LayoutWidgetsPage extends StatefulWidget {
  const LayoutWidgetsPage({super.key});

  @override
  State<LayoutWidgetsPage> createState() => _LayoutWidgetsPageState();
}

class _LayoutWidgetsPageState extends State<LayoutWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02단계: 레이아웃 위젯'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Container
            _buildSection(
              title: '1. Container',
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        '기본 Container',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.green.shade700, width: 2),
                    ),
                    child: const Center(
                      child: Text(
                        '둥근 모서리',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // 2. Padding
            _buildSection(
              title: '2. Padding',
              child: Container(
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.orange,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Padding 예제',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const Divider(height: 40),

            // 3. Row
            _buildSection(
              title: '3. Row (가로 배치)',
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildColoredBox(Colors.red, '1'),
                      _buildColoredBox(Colors.green, '2'),
                      _buildColoredBox(Colors.blue, '3'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildColoredBox(Colors.red, '1'),
                      _buildColoredBox(Colors.green, '2'),
                      _buildColoredBox(Colors.blue, '3'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildColoredBox(Colors.red, '1'),
                      _buildColoredBox(Colors.green, '2'),
                      _buildColoredBox(Colors.blue, '3'),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // 4. Column
            _buildSection(
              title: '4. Column (세로 배치)',
              // 세로 정렬 차이가 보이려면 Column에 고정 높이가 필요합니다
              // (높이가 없으면 자식 크기만큼 줄어들어 모두 똑같이 보임)
              child: Row(
                children: [
                  _buildFixedHeightColumn(
                    Column(
                      children: [
                        _buildColoredBox(Colors.red, '1'),
                        _buildColoredBox(Colors.green, '2'),
                        _buildColoredBox(Colors.blue, '3'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildFixedHeightColumn(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildColoredBox(Colors.red, '1'),
                        _buildColoredBox(Colors.green, '2'),
                        _buildColoredBox(Colors.blue, '3'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildFixedHeightColumn(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildColoredBox(Colors.red, '1'),
                        _buildColoredBox(Colors.green, '2'),
                        _buildColoredBox(Colors.blue, '3'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // 5. Stack
            _buildSection(
              title: '5. Stack (겹쳐서 배치)',
              child: SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.blue.shade300,
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green.shade300,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red.shade300,
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Stack 예제',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(height: 40),

            // 6. Expanded/Flexible
            _buildSection(
              title: '6. Expanded / Flexible',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.red,
                          child: const Center(child: Text('1', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          color: Colors.green,
                          child: const Center(child: Text('2', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.blue,
                          child: const Center(child: Text('1', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.orange,
                          child: const Center(child: Text('Flexible', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.purple,
                        child: const Center(child: Text('고정', style: TextStyle(color: Colors.white))),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          height: 50,
                          color: Colors.teal,
                          child: const Center(child: Text('Flexible', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // 7. SizedBox
            _buildSection(
              title: '7. SizedBox',
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('고정 크기 버튼'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('전체 너비 버튼'),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // 8. Center
            _buildSection(
              title: '8. Center',
              child: Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Text(
                    '중앙 정렬된 텍스트',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const Divider(height: 40),

            // 9. 실전 예제
            _buildSection(
              title: '9. 실전 예제: 카드 레이아웃',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(Icons.person, size: 30, color: Colors.blue),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '사용자 이름',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '사용자 설명',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(Icons.thumb_up, '좋아요'),
                        _buildActionButton(Icons.comment, '댓글'),
                        _buildActionButton(Icons.share, '공유'),
                      ],
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

  Widget _buildColoredBox(Color color, String text) {
    return Container(
      width: 60,
      height: 60,
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 고정 높이 + 테두리를 씌워 세로 정렬 차이를 눈에 보이게 하는 상자
  Widget _buildFixedHeightColumn(Widget child) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: child,
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

