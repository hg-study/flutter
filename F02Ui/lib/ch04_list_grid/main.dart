import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '04단계: 리스트와 그리드',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ListAndGridPage(),
    );
  }
}

class ListAndGridPage extends StatefulWidget {
  const ListAndGridPage({super.key});

  @override
  State<ListAndGridPage> createState() => _ListAndGridPageState();
}

class _ListAndGridPageState extends State<ListAndGridPage> {
  final List<String> _items = List.generate(20, (index) => '항목 ${index + 1}');
  final List<Map<String, dynamic>> _products = List.generate(
    12,
    (index) => {
      'name': '상품 ${index + 1}',
      'price': (index + 1) * 1000,
      'color': Colors.primaries[index % Colors.primaries.length],
    },
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('04단계: 리스트와 그리드'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'ListView'),
              Tab(text: 'GridView'),
              Tab(text: 'Card'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // 1. ListView
            _buildListViewTab(),
            // 2. GridView
            _buildGridViewTab(),
            // 3. Card 예제
            _buildCardTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSection(
          title: '1. ListView (기본)',
          child: Column(
            children: _items.take(5).map((item) {
              return ListTile(
                leading: CircleAvatar(child: Text(item.split(' ')[1])),
                title: Text(item),
                subtitle: Text('부제목: $item'),
                trailing: const Icon(Icons.chevron_right),
              );
            }).toList(),
          ),
        ),
        const Divider(height: 40),
        _buildSection(
          title: '2. ListView.builder (동적)',
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('${index + 1}'),
                ),
                title: Text('동적 항목 ${index + 1}'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('항목 ${index + 1} 클릭')),
                  );
                },
              );
            },
          ),
        ),
        const Divider(height: 40),
        _buildSection(
          title: '3. ListView.separated',
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('항목 ${index + 1}'),
                subtitle: Text('구분선이 있는 리스트'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGridViewTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return Container(
          decoration: BoxDecoration(
            color: (product['color'] as Color).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: product['color'], width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag, size: 50, color: product['color']),
              const SizedBox(height: 8),
              Text(
                product['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${product['price']}원'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCardTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSection(
          title: '1. 기본 Card',
          child: Card(
            child: ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text('카드 제목'),
              subtitle: const Text('카드 부제목'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: '2. 복잡한 Card',
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '카드 제목',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('카드 내용입니다. 여러 줄로 표시될 수 있습니다.'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: () {}, child: const Text('취소')),
                          const SizedBox(width: 8),
                          ElevatedButton(onPressed: () {}, child: const Text('확인')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: '3. ListTile in Card',
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: const Text('사용자 이름'),
                  subtitle: const Text('사용자 설명'),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('설정'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('도움말'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('로그아웃'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
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
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

