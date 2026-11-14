import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '07-01: ColorScheme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ColorSchemePage(),
    );
  }
}

class ColorSchemePage extends StatelessWidget {
  const ColorSchemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('07-01: ColorScheme'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 설명
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
                    'ColorScheme이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Material Design 3의 색상 시스템'),
                  Text('• 일관된 색상 사용'),
                  Text('• Theme.of(context).colorScheme으로 접근'),
                  Text('• 배경색과 on색상은 항상 짝으로 사용'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ColorScheme 색상들
            const Text(
              'ColorScheme 색상',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            // 각 배경색 위의 글자는 짝이 되는 on* 색상을 사용해야 잘 보입니다
            // (예: primary 배경 → onPrimary 글자)
            _buildColorBox('Primary', theme.colorScheme.primary,
                theme.colorScheme.onPrimary),
            _buildColorBox('Secondary', theme.colorScheme.secondary,
                theme.colorScheme.onSecondary),
            _buildColorBox('Error', theme.colorScheme.error,
                theme.colorScheme.onError),
            _buildColorBox('Surface', theme.colorScheme.surface,
                theme.colorScheme.onSurface),
            _buildColorBox('PrimaryContainer', theme.colorScheme.primaryContainer,
                theme.colorScheme.onPrimaryContainer),
            _buildColorBox('SecondaryContainer',
                theme.colorScheme.secondaryContainer,
                theme.colorScheme.onSecondaryContainer),
          ],
        ),
      ),
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

