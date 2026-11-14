import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '05단계: 외부 패키지 사용',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExternalPackagePage(),
    );
  }
}

class ExternalPackagePage extends StatefulWidget {
  const ExternalPackagePage({super.key});

  @override
  State<ExternalPackagePage> createState() => _ExternalPackagePageState();
}

class _ExternalPackagePageState extends State<ExternalPackagePage> {
  // 세 가지 요청(GET/POST/여러 데이터)이 하나의 응답 영역을 공유합니다.
  // 어떤 요청의 결과인지 _lastRequest에 저장해서 함께 표시합니다.
  String _responseData = '';
  bool _isLoading = false;
  String _error = '';
  String _lastRequest = '';

  // GET 요청 예제
  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _error = '';
      _responseData = '';
      _lastRequest = 'GET 요청';
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _responseData = json.encode(data);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = '에러: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = '에러: $e';
        _isLoading = false;
      });
    }
  }

  // POST 요청 예제
  Future<void> _postData() async {
    setState(() {
      _isLoading = true;
      _error = '';
      _responseData = '';
      _lastRequest = 'POST 요청';
    });

    try {
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter 예제',
          'body': '외부 패키지 사용 예제입니다',
          'userId': 1,
        }),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        setState(() {
          _responseData = json.encode(data);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = '에러: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = '에러: $e';
        _isLoading = false;
      });
    }
  }

  // 여러 데이터 가져오기 예제
  Future<void> _fetchMultipleData() async {
    setState(() {
      _isLoading = true;
      _error = '';
      _responseData = '';
      _lastRequest = '여러 데이터 가져오기';
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=5'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _responseData = '총 ${data.length}개의 항목\n\n';
          for (var item in data) {
            _responseData += '제목: ${item['title']}\n';
            _responseData += 'ID: ${item['id']}\n\n';
          }
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = '에러: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = '에러: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('05단계: 외부 패키지 사용'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: '1. pubspec.yaml에 패키지 추가',
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
                      'pubspec.yaml에 추가:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('dependencies:'),
                    Text('  http: ^1.1.2'),
                    SizedBox(height: 8),
                    Text('그 다음 실행:'),
                    Text('flutter pub get'),
                  ],
                ),
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '2. GET 요청 (데이터 가져오기)',
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _isLoading ? null : _fetchData,
                    icon: const Icon(Icons.download),
                    label: const Text('GET 요청'),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '3. POST 요청 (데이터 전송)',
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _isLoading ? null : _postData,
                    icon: const Icon(Icons.upload),
                    label: const Text('POST 요청'),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '4. 여러 데이터 가져오기',
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _isLoading ? null : _fetchMultipleData,
                    icon: const Icon(Icons.list),
                    label: const Text('여러 데이터 가져오기'),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            // 2~4번 요청의 결과가 모두 이곳에 표시됩니다 (공통 응답 영역)
            _buildSection(
              title: '응답 결과 (2~4번 공통)',
              child: _buildResponseArea(),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '5. 패키지 정보',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '사용 중인 패키지:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('• http: HTTP 요청'),
                    Text('• provider: 상태 관리'),
                    Text('• shared_preferences: 로컬 저장'),
                    Text('• path_provider: 경로 관리'),
                    Text('• image_picker: 이미지 선택'),
                    SizedBox(height: 16),
                    Text(
                      '패키지 찾기:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('https://pub.dev'),
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

  Widget _buildResponseArea() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red.shade200),
        ),
        child: Row(
          children: [
            const Icon(Icons.error, color: Colors.red),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _error,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    }

    if (_responseData.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  '응답 데이터 ($_lastRequest):',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SelectableText(
              _responseData,
              style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Center(
        child: Text('버튼을 클릭하여 요청을 보내세요'),
      ),
    );
  }
}

