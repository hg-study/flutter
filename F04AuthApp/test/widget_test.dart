// 기본 위젯 테스트
//
// 스플래시 화면이 정상적으로 표시되는지 확인하는 간단한 스모크 테스트입니다.

import 'package:flutter_test/flutter_test.dart';

import 'package:ch04_flutter/main.dart';

void main() {
  testWidgets('스플래시 화면 표시 테스트', (WidgetTester tester) async {
    // 앱을 빌드하고 첫 프레임을 그립니다.
    await tester.pumpWidget(const MyApp());

    // 스플래시 화면(로딩 인디케이터)이 표시되는지 확인
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
