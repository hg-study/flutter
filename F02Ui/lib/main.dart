import 'package:flutter/material.dart';

// 각 챕터 파일에도 MyApp, main()이 있어서 이름이 겹칩니다.
// as 별칭을 붙이면 ch01.WidgetBasicsPage처럼 구분해서 쓸 수 있습니다.
import 'ch01_widget_basics/main.dart' as ch01;
import 'ch02_layout_widgets/main.dart' as ch02;
import 'ch03_basic_ui_widgets/main.dart' as ch03;
import 'ch04_list_grid/main.dart' as ch04;
import 'ch05_navigation/main.dart' as ch05;
import 'ch06_form_input/main.dart' as ch06;
import 'ch07_theme_styling/main.dart' as ch07;
import 'ch08_advanced_layout/main.dart' as ch08;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI 배우기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ChapterListPage(),
    );
  }
}

// 챕터 목록 화면: 항목을 누르면 Navigator.push로 해당 챕터 화면으로 이동합니다
// (이 화면 자체가 Navigator 사용 예제이기도 합니다)
class ChapterListPage extends StatelessWidget {
  const ChapterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter UI 배우기'),
      ),
      body: ListView(
        children: [
          _buildChapterTile(context, '01. 위젯 기초', const ch01.WidgetBasicsPage()),
          _buildChapterTile(context, '02. 레이아웃 위젯', const ch02.LayoutWidgetsPage()),
          _buildChapterTile(context, '03. 기본 UI 위젯', const ch03.BasicUIWidgetsPage()),
          _buildChapterTile(context, '04. 리스트와 그리드', const ch04.ListAndGridPage()),
          _buildChapterTile(context, '05. 네비게이션', const ch05.NavigationPage()),
          _buildChapterTile(context, '06. 폼과 입력', const ch06.FormAndInputPage()),
          _buildChapterTile(context, '07. 테마와 스타일링', const ch07.ThemeAndStylingPage()),
          _buildChapterTile(context, '08. 고급 레이아웃', const ch08.AdvancedLayoutPage()),
        ],
      ),
    );
  }

  Widget _buildChapterTile(BuildContext context, String title, Widget page) {
    return ListTile(
      leading: const Icon(Icons.menu_book, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Navigator.push: 새 화면을 쌓아서 이동 (뒤로가기로 돌아옴)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
