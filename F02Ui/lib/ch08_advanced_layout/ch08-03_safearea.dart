import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '08-03: SafeArea',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SafeAreaPage(),
    );
  }
}

// AppBar가 있으면 body가 상태바를 침범할 일이 없어서 SafeArea 효과가
// 보이지 않습니다. 그래서 이 예제는 일부러 AppBar 없이 만들었습니다.
class SafeAreaPage extends StatefulWidget {
  const SafeAreaPage({super.key});

  @override
  State<SafeAreaPage> createState() => _SafeAreaPageState();
}

class _SafeAreaPageState extends State<SafeAreaPage> {
  bool _useSafeArea = false;

  @override
  Widget build(BuildContext context) {
    // 화면 맨 위까지 올라가는 내용
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이 빨간 상자가 화면 맨 위에 붙습니다
        // SafeArea가 없으면 상태바(시계, 배터리)에 가려집니다
        Container(
          width: double.infinity,
          color: Colors.red,
          padding: const EdgeInsets.all(16),
          child: const Text(
            '나는 화면 맨 위! (SafeArea가 없으면 상태바에 가려짐)',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
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
                  'SafeArea란?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('• 상태바, 노치 등 시스템 UI 영역을 피해서 배치'),
                Text('• 스위치를 켜고 끄면서 빨간 상자를 관찰하세요'),
                Text('• 켜면 빨간 상자가 상태바 아래로 내려옵니다'),
              ],
            ),
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
      ],
    );

    return Scaffold(
      // AppBar 없음: body가 상태바 뒤까지 올라갑니다
      body: _useSafeArea ? SafeArea(child: content) : content,
    );
  }
}
