// 챕터 런처 화면이 잘 뜨는지 확인하는 기본 테스트입니다.

import 'package:flutter_test/flutter_test.dart';

import 'package:ch02_ui/main.dart';

void main() {
  testWidgets('챕터 목록이 표시된다', (WidgetTester tester) async {
    // 앱을 빌드하고 첫 프레임을 그립니다.
    await tester.pumpWidget(const MyApp());

    // 앱 제목과 챕터 항목이 보이는지 확인합니다.
    expect(find.text('Flutter UI 배우기'), findsOneWidget);
    expect(find.text('01. 위젯 기초'), findsOneWidget);
    expect(find.text('08. 고급 레이아웃'), findsOneWidget);
  });
}
