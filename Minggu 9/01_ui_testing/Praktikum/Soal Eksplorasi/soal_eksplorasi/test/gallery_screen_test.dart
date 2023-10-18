import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal_eksplorasi/screens/gallery_screen.dart';

void main() {
  testWidgets('Judul harus Home', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: GalleryScreen(), //Halaman belum selesai dibuat
    ));

    expect(find.text('Gallery'), findsOneWidget);
  });

  testWidgets('Body harus memiliki judul Image List dan Widget Image',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: GalleryScreen(), //Halaman belum selesai dibuat
    ));

    expect(find.byType(Image), findsWidgets);
    expect(find.text('Image List'), findsOneWidget);
  });
}
