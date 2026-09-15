// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_pertama/main.dart';

void main() {
  testWidgets('user can open a profile and pricing page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Beranda'), findsOneWidget);
    expect(find.text('Zulfa Fitri'), findsOneWidget);

    await tester.tap(find.text('Zulfa Fitri'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Profil'), findsOneWidget);
    expect(find.text('Follow'), findsOneWidget);

    await tester.tap(find.text('Follow'));
    await tester.pump();
    expect(find.text('Following'), findsOneWidget);

    await tester.tap(find.text('Lihat Paket Harga'));
    await tester.pumpAndSettle();
    expect(find.text('Layanan IT'), findsOneWidget);
    expect(find.text('Paket Profesional'), findsOneWidget);
  });
}
