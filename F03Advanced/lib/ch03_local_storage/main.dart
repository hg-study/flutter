import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03단계: 로컬 저장소',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LocalStoragePage(),
    );
  }
}

class LocalStoragePage extends StatefulWidget {
  const LocalStoragePage({super.key});

  @override
  State<LocalStoragePage> createState() => _LocalStoragePageState();
}

class _LocalStoragePageState extends State<LocalStoragePage> {
  String _prefsValue = '';
  String _fileContent = '';
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _loadFile();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // SharedPreferences 예제
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return; // await 후 화면이 이미 사라졌으면 중단
    setState(() {
      _prefsValue = prefs.getString('my_key') ?? '저장된 값 없음';
    });
  }

  Future<void> _savePreferences(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('my_key', value);
    await _loadPreferences();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('SharedPreferences에 저장되었습니다')),
      );
    }
  }

  Future<void> _removePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('my_key');
    await _loadPreferences();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('SharedPreferences에서 삭제되었습니다')),
      );
    }
  }

  // File I/O 예제
  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _getLocalFile() async {
    final path = await _getLocalPath();
    return File('$path/my_file.txt');
  }

  Future<void> _loadFile() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        final content = await file.readAsString();
        if (!mounted) return; // await 후 화면이 이미 사라졌으면 중단
        setState(() {
          _fileContent = content;
        });
      } else {
        if (!mounted) return;
        setState(() {
          _fileContent = '파일이 없습니다';
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _fileContent = '에러: $e';
      });
    }
  }

  Future<void> _saveFile(String content) async {
    try {
      final file = await _getLocalFile();
      await file.writeAsString(content);
      await _loadFile();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('파일에 저장되었습니다')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('에러: $e')),
        );
      }
    }
  }

  Future<void> _deleteFile() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        await file.delete();
        await _loadFile();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('파일이 삭제되었습니다')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('에러: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03단계: 로컬 저장소'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: '1. SharedPreferences (간단한 키-값 저장)',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '저장된 값:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _prefsValue,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: '저장할 값 입력',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_textController.text.isNotEmpty) {
                                _savePreferences(_textController.text);
                                _textController.clear();
                              }
                            },
                            child: const Text('저장'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _removePreferences,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('삭제'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '2. File I/O (파일 읽기/쓰기)',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '파일 내용:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        _fileContent,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // 예제 단순화를 위해 다이얼로그용 컨트롤러를 여기서 생성.
                              // 실제 앱에서는 dispose로 정리가 필요합니다.
                              final controller = TextEditingController();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('파일 저장'),
                                  content: TextField(
                                    controller: controller,
                                    decoration: const InputDecoration(
                                      hintText: '내용을 입력하세요',
                                    ),
                                    maxLines: 5,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('취소'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (controller.text.isNotEmpty) {
                                          _saveFile(controller.text);
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text('저장'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('파일 저장'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _deleteFile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('파일 삭제'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '3. 실전 예제: 설정 저장',
              child: const SettingsExample(),
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
}

// 설정 저장 예제
class SettingsExample extends StatefulWidget {
  const SettingsExample({super.key});

  @override
  State<SettingsExample> createState() => _SettingsExampleState();
}

class _SettingsExampleState extends State<SettingsExample> {
  bool _notificationsEnabled = false;
  // 주의: build 안에서 TextEditingController(text: ...)를 새로 만들면
  // 리빌드마다 컨트롤러가 교체되어 커서가 매번 처음으로 돌아갑니다.
  // → 컨트롤러는 상태 변수로 한 번만 만들고 dispose에서 정리합니다.
  final TextEditingController _usernameController = TextEditingController();
  int _themeIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return; // await 후 화면이 이미 사라졌으면 중단
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications') ?? false;
      _usernameController.text = prefs.getString('username') ?? '';
      _themeIndex = prefs.getInt('theme') ?? 0;
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', _notificationsEnabled);
    await prefs.setString('username', _usernameController.text);
    await prefs.setInt('theme', _themeIndex);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('설정이 저장되었습니다')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            '앱 설정',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('알림 받기'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: '사용자 이름',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              labelText: '테마',
              border: OutlineInputBorder(),
            ),
            initialValue: _themeIndex,
            items: const [
              DropdownMenuItem(value: 0, child: Text('라이트')),
              DropdownMenuItem(value: 1, child: Text('다크')),
            ],
            onChanged: (value) {
              setState(() {
                _themeIndex = value ?? 0;
              });
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('설정 저장'),
            ),
          ),
        ],
      ),
    );
  }
}

