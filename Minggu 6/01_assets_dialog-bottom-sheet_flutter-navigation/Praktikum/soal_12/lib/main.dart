import 'package:flutter/material.dart';
import 'package:soal_12/screens/detail_gallery_screen.dart';
import 'package:soal_12/screens/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soal Minggu 12',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const GalleryScreen(),
        '/detail-gallery': (_) => const DetailGalleryScreen()
      },
    );
  }
}
