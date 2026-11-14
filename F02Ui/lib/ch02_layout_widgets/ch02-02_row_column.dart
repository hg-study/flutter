import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-02: Row와 Column',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const RowColumnPage(),
    );
  }
}

class RowColumnPage extends StatelessWidget {
  const RowColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02-02: Row와 Column'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 설명
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Row란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 가로 방향으로 위젯 배치'),
                  Text('• mainAxisAlignment: 주축(가로) 정렬'),
                  Text('• crossAxisAlignment: 교차축(세로) 정렬'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Row 예제
            const Text(
              'Row 예제',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                // Row - start
                Row(
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: start (기본값)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - center
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: center', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - end
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: end', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - spaceBetween
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: spaceBetween', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - spaceAround
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: spaceAround', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 16),
                // Row - spaceEvenly
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColoredBox(Colors.red, '1'),
                    _buildColoredBox(Colors.green, '2'),
                    _buildColoredBox(Colors.blue, '3'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('mainAxisAlignment: spaceEvenly', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 40),
            const Divider(height: 40),

            // Column 설명
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Column이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 세로 방향으로 위젯 배치'),
                  Text('• mainAxisAlignment: 주축(세로) 정렬'),
                  Text('• crossAxisAlignment: 교차축(가로) 정렬'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Column 예제
            const Text(
              'Column 예제',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            // 세로 정렬 차이가 보이려면 Column에 고정 높이가 필요합니다
            // (높이가 없으면 자식 크기만큼 줄어들어 모두 똑같이 보임)
            Row(
              children: [
                // Column - start
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
                // Column - center
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
                // Column - end
                _buildFixedHeightColumn(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildColoredBox(Colors.red, '1'),
                      _buildColoredBox(Colors.green, '2'),
                      _buildColoredBox(Colors.blue, '3'),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Column - spaceEvenly
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
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('start', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('center', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('end', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('spaceEvenly', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 24),

            // crossAxisAlignment 예제
            const Text(
              'crossAxisAlignment 예제 (Column)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            // 자식들의 너비가 서로 달라야 (40/60/80) 가로 정렬 차이가 보입니다
            Row(
              children: [
                // crossAxisAlignment.start
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildColoredBox(Colors.red, '1', width: 40),
                    _buildColoredBox(Colors.green, '2', width: 60),
                    _buildColoredBox(Colors.blue, '3', width: 80),
                  ],
                ),
                const SizedBox(width: 16),
                // crossAxisAlignment.center
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildColoredBox(Colors.red, '1', width: 40),
                    _buildColoredBox(Colors.green, '2', width: 60),
                    _buildColoredBox(Colors.blue, '3', width: 80),
                  ],
                ),
                const SizedBox(width: 16),
                // crossAxisAlignment.end
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildColoredBox(Colors.red, '1', width: 40),
                    _buildColoredBox(Colors.green, '2', width: 60),
                    _buildColoredBox(Colors.blue, '3', width: 80),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('start', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('center', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(width: 16),
                const Text('end', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 24),

            // crossAxisAlignment.stretch: 자식들이 가로로 꽉 늘어납니다
            const Text(
              'crossAxisAlignment: stretch',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildColoredBox(Colors.red, '1', width: 40),
                  _buildColoredBox(Colors.green, '2', width: 60),
                  _buildColoredBox(Colors.blue, '3', width: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredBox(Color color, String text, {double width = 60}) {
    return Container(
      width: width,
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
}

