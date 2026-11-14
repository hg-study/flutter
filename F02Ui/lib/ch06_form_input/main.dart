import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '06단계: 폼과 입력',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FormAndInputPage(),
    );
  }
}

class FormAndInputPage extends StatefulWidget {
  const FormAndInputPage({super.key});

  @override
  State<FormAndInputPage> createState() => _FormAndInputPageState();
}

class _FormAndInputPageState extends State<FormAndInputPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isChecked = false;
  bool _switchValue = false;
  double _sliderValue = 50;
  String _selectedValue = '옵션 1';
  final List<String> _options = ['옵션 1', '옵션 2', '옵션 3'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('폼 제출 성공!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('06단계: 폼과 입력'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: '1. TextField',
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: '기본 입력',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: '힌트가 있는 입력',
                        hintText: '여기에 입력하세요',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 40),
              _buildSection(
                title: '2. TextFormField (검증)',
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: '이름',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '이름을 입력하세요';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: '이메일',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '이메일을 입력하세요';
                        }
                        if (!value.contains('@')) {
                          return '올바른 이메일을 입력하세요';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: '비밀번호',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return '비밀번호는 6자 이상이어야 합니다';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const Divider(height: 40),
              _buildSection(
                title: '3. Checkbox',
                child: CheckboxListTile(
                  title: const Text('약관에 동의합니다'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
              ),
              const Divider(height: 40),
              _buildSection(
                title: '4. Switch',
                child: SwitchListTile(
                  title: const Text('알림 받기'),
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ),
              const Divider(height: 40),
              _buildSection(
                title: '5. Radio',
                // 새로운 RadioGroup 패턴 (Flutter 3.32+):
                // 부모 RadioGroup이 groupValue와 onChanged를 한 번만 관리하고,
                // 자식 RadioListTile은 value만 가지면 됩니다.
                child: RadioGroup<String>(
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
              ),
              const Divider(height: 40),
              _buildSection(
                title: '6. Slider',
                child: Column(
                  children: [
                    Text('값: ${_sliderValue.toInt()}'),
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
              const Divider(height: 40),
              _buildSection(
                title: '7. DropdownButton',
                child: DropdownButtonFormField<String>(
                  initialValue: _selectedValue,
                  decoration: const InputDecoration(
                    labelText: '선택',
                    border: OutlineInputBorder(),
                  ),
                  items: _options.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ),
              const Divider(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('제출'),
                ),
              ),
            ],
          ),
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
}

