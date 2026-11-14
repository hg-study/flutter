import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03단계: 기본 UI 위젯',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BasicUIWidgetsPage(),
    );
  }
}

class BasicUIWidgetsPage extends StatefulWidget {
  const BasicUIWidgetsPage({super.key});

  @override
  State<BasicUIWidgetsPage> createState() => _BasicUIWidgetsPageState();
}

class _BasicUIWidgetsPageState extends State<BasicUIWidgetsPage> {
  bool _isLiked = false;
  int _likeCount = 0;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _likeCount++;
      } else {
        _likeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03단계: 기본 UI 위젯'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Text
            _buildSection(
              title: '1. Text',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('기본 텍스트'),
                  const SizedBox(height: 8),
                  const Text(
                    '큰 텍스트',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '색상이 있는 텍스트',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '여러 줄 텍스트\n두 번째 줄\n세 번째 줄',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // 2. Icon
            _buildSection(
              title: '2. Icon',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  const Icon(Icons.home, size: 40, color: Colors.blue),
                  const Icon(Icons.favorite, size: 40, color: Colors.red),
                  const Icon(Icons.star, size: 40, color: Colors.amber),
                  const Icon(Icons.settings, size: 40, color: Colors.grey),
                  IconButton(
                    icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                    color: _isLiked ? Colors.red : Colors.grey,
                    iconSize: 40,
                    onPressed: _toggleLike,
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // 3. Image
            _buildSection(
              title: '3. Image',
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.image, size: 80, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  const Text('이미지 영역 (실제 이미지 사용 시 Image.asset 또는 Image.network 사용)'),
                ],
              ),
            ),

            const Divider(height: 40),

            // 4. Button
            _buildSection(
              title: '4. Button',
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ElevatedButton'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text('TextButton'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('OutlinedButton'),
                  ),
                  const SizedBox(height: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text('다운로드'),
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // 5. FloatingActionButton
            _buildSection(
              title: '5. FloatingActionButton',
              child: Container(
                height: 100,
                alignment: Alignment.center,
                // heroTag: 한 화면에 FAB가 여러 개면 각각 고유한 heroTag가 필요합니다
                // (같은 태그가 2개 이상이면 화면 전환 시 Hero 충돌로 앱이 죽습니다)
                child: FloatingActionButton(
                  heroTag: 'fab_body',
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
            ),

            const Divider(height: 40),

            // 6. 실전 예제: 카드 UI
            _buildSection(
              title: '6. 실전 예제: 카드 UI',
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Icon(Icons.person, color: Colors.blue),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '사용자 이름',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2시간 전',
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_horiz),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '게시물 내용입니다. 여러 줄로 표시될 수 있습니다.',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                            color: _isLiked ? Colors.red : Colors.grey,
                            onPressed: _toggleLike,
                          ),
                          Text('$_likeCount'),
                          const SizedBox(width: 16),
                          IconButton(
                            icon: const Icon(Icons.comment_outlined),
                            onPressed: () {},
                          ),
                          const Text('댓글'),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.share_outlined),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab_scaffold',
        onPressed: () {},
        child: const Icon(Icons.add),
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
}

