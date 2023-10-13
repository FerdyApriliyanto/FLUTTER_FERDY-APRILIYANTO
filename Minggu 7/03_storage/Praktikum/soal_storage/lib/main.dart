import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_storage/models/db_manager.dart';
import 'package:soal_storage/screens/contact/contact_provider.dart';
import 'package:soal_storage/screens/contact/contact_screen.dart';
import 'package:soal_storage/screens/login_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => DbManager(),
    ),
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soal Storage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const ContactScreen(),
      },
    );
  }
}
