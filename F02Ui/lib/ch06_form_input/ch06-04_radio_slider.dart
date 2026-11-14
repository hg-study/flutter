import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '06-04: Radio와 Slider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const RadioSliderPage(),
    );
  }
}

class RadioSliderPage extends StatefulWidget {
  const RadioSliderPage({super.key});

  @override
  State<RadioSliderPage> createState() => _RadioSliderPageState();
}

class _RadioSliderPageState extends State<RadioSliderPage> {
  String _selectedValue = '옵션 1';
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('06-04: Radio와 Slider'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Radio 설명
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
                    'Radio와 Slider',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Radio: 단일 선택'),
                  Text('• Slider: 값 범위 선택'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1: Radio
            const Text(
              '1. Radio',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            // 새로운 RadioGroup 패턴 (Flutter 3.32+):
            // 부모 RadioGroup이 groupValue와 onChanged를 한 번만 관리하고,
            // 자식 RadioListTile은 value만 가지면 됩니다.
            RadioGroup<String>(
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
              child: const Column(
                children: [
                  RadioListTile<String>(
                    title: Text('옵션 1'),
                    value: '옵션 1',
                  ),
                  RadioListTile<String>(
                    title: Text('옵션 2'),
                    value: '옵션 2',
                  ),
                  RadioListTile<String>(
                    title: Text('옵션 3'),
                    value: '옵션 3',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '선택된 값: $_selectedValue',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            // 예제 2: Slider
            const Text(
              '2. Slider',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '값: ${_sliderValue.toInt()}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

