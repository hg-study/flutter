import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '07단계: 테마와 스타일링',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const ThemeAndStylingPage(),
    );
  }
}

class ThemeAndStylingPage extends StatefulWidget {
  const ThemeAndStylingPage({super.key});

  @override
  State<ThemeAndStylingPage> createState() => _ThemeAndStylingPageState();
}

class _ThemeAndStylingPageState extends State<ThemeAndStylingPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('07단계: 테마와 스타일링'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: '1. ColorScheme',
              child: Column(
                children: [
                  // 각 배경색 위의 글자는 짝이 되는 on* 색상을 사용해야 잘 보입니다
                  _buildColorBox('Primary', theme.colorScheme.primary,
                      theme.colorScheme.onPrimary),
                  _buildColorBox('Secondary', theme.colorScheme.secondary,
                      theme.colorScheme.onSecondary),
                  _buildColorBox('Error', theme.colorScheme.error,
                      theme.colorScheme.onError),
                  _buildColorBox('Surface', theme.colorScheme.surface,
                      theme.colorScheme.onSurface),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '2. TextStyle',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Display Large', style: theme.textTheme.displayLarge),
                  Text('Body Large', style: theme.textTheme.bodyLarge),
                  Text('Custom Style', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  )),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '3. BoxDecoration',
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(child: Text('둥근 모서리', style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(child: Text('그라데이션', style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(child: Text('그림자')),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '4. BorderRadius',
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '5. 실전 예제: 스타일링된 카드',
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.star, size: 50, color: Colors.white),
                      const SizedBox(height: 12),
                      const Text(
                        '스타일링된 카드',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '그라데이션과 둥근 모서리',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
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

  // onColor: 배경색 위에서 잘 보이도록 정해진 글자색 (on* 색상)
  Widget _buildColorBox(String label, Color color, Color onColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: onColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            // toARGB32(): 색상을 정수로 변환 (Color.value는 deprecated)
            '#${color.toARGB32().toRadixString(16).substring(2)}',
            style: TextStyle(color: onColor.withValues(alpha: 0.7)),
          ),
        ],
      ),
    );
  }
}

