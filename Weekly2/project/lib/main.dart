import 'package:flutter/material.dart';
import 'package:project/colors/global_color.dart';
import 'package:project/screens/about_screen/about_screen.dart';
import 'package:project/screens/contact_screen/contact_screen.dart';
import 'package:project/screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soal Code Competence 2',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: GlobalColor().primaryColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactScreen(),
        '/about': (context) => const AboutScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
