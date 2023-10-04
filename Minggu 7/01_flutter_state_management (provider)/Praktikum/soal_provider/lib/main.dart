import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_provider/provider/color_form_provider.dart';
import 'package:soal_provider/provider/crud_provider.dart';
import 'package:soal_provider/provider/date_form_provider.dart';
import 'package:soal_provider/provider/file_form_provider.dart';
import 'package:soal_provider/provider/name_form_provider.dart';
import 'package:soal_provider/provider/phone_form_provider.dart';
import 'package:soal_provider/screens/contact_screen.dart';
import 'package:soal_provider/screens/detail_gallery_screen.dart';
import 'package:soal_provider/screens/gallery_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NameFormProvider()),
      ChangeNotifierProvider(create: (_) => PhoneFormProvider()),
      ChangeNotifierProvider(create: (_) => CrudProvider()),
      ChangeNotifierProvider(create: (_) => DateFormProvider()),
      ChangeNotifierProvider(create: (_) => ColorFormProvider()),
      ChangeNotifierProvider(create: (_) => FileFormProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soal Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => ContactScreen(),
        '/gallery': (_) => const GalleryScreen(),
        '/detail-gallery': (_) => const DetailGalleryScreen()
      },
    );
  }
}
