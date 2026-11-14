import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '08단계: 고급 레이아웃',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AdvancedLayoutPage(),
    );
  }
}

class AdvancedLayoutPage extends StatelessWidget {
  const AdvancedLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('08단계: 고급 레이아웃'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: '1. Wrap (자동 줄바꿈)',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(10, (index) {
                  return Chip(
                    label: Text('태그 ${index + 1}'),
                    avatar: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                  );
                }),
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '2. Flexible vs Expanded',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          color: Colors.red,
                          child: const Center(child: Text('Expanded (필수)', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.blue,
                          child: const Center(child: Text('Flexible (선택)', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 50,
                          color: Colors.green,
                          child: const Center(child: Text('Flexible', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.orange,
                        child: const Center(child: Text('고정', style: TextStyle(color: Colors.white))),
                      ),
                      Flexible(
                        child: Container(
                          height: 50,
                          color: Colors.purple,
                          child: const Center(child: Text('Flexible', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '3. AspectRatio',
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '16:9 비율',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '4. ConstrainedBox',
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 200,
                  minHeight: 50,
                  maxHeight: 100,
                ),
                child: Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text('크기 제약', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '5. SingleChildScrollView',
              child: SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(10, (index) {
                      return Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.primaries[index % Colors.primaries.length],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '항목 ${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '6. SafeArea',
              // AppBar가 있는 이 화면에서는 SafeArea 효과가 보이지 않으므로
              // AppBar 없는 데모 화면으로 이동해서 확인합니다
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• 상태바, 노치 등 시스템 UI 영역을 피해서 배치'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SafeAreaDemoPage(),
                        ),
                      );
                    },
                    child: const Text('SafeArea 데모 보기'),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '7. 실전 예제: 반응형 레이아웃',
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 600;
                  return isWide
                      ? Row(
                          children: [
                            Expanded(
                              child: _buildExampleCard('카드 1', Colors.blue),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildExampleCard('카드 2', Colors.green),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildExampleCard('카드 3', Colors.orange),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _buildExampleCard('카드 1', Colors.blue),
                            const SizedBox(height: 16),
                            _buildExampleCard('카드 2', Colors.green),
                            const SizedBox(height: 16),
                            _buildExampleCard('카드 3', Colors.orange),
                          ],
                        );
                },
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

  Widget _buildExampleCard(String title, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          Icon(Icons.star, color: color, size: 40),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// SafeArea 데모: AppBar가 없어야 body가 상태바 뒤까지 올라가서
// SafeArea의 효과를 눈으로 확인할 수 있습니다
class SafeAreaDemoPage extends StatefulWidget {
  const SafeAreaDemoPage({super.key});

  @override
  State<SafeAreaDemoPage> createState() => _SafeAreaDemoPageState();
}

class _SafeAreaDemoPageState extends State<SafeAreaDemoPage> {
  bool _useSafeArea = false;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SafeArea가 없으면 이 빨간 상자가 상태바에 가려집니다
        Container(
          width: double.infinity,
          color: Colors.red,
          padding: const EdgeInsets.all(16),
          child: const Text(
            '나는 화면 맨 위! (SafeArea가 없으면 상태바에 가려짐)',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        // 스위치로 SafeArea를 켜고 끄면서 차이를 확인합니다
        SwitchListTile(
          title: const Text('SafeArea 사용'),
          value: _useSafeArea,
          onChanged: (value) {
            setState(() {
              _useSafeArea = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('돌아가기'),
          ),
        ),
      ],
    );

    return Scaffold(
      // AppBar 없음: body가 상태바 뒤까지 올라갑니다
      body: _useSafeArea ? SafeArea(child: content) : content,
    );
  }
}

