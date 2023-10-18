import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal_prioritas_1_2/screens/home_screen.dart';

// SOAL PRIORITAS 2
void main() {
  testWidgets('Judul harus Home', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(), //Halaman belum selesai dibuat
    ));

    expect(find.text('Home'), findsOneWidget);
  });
}
