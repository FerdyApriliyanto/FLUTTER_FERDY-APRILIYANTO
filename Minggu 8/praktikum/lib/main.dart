import 'package:flutter/material.dart';
import 'package:praktikum/screens/contact/contact_screen.dart';
import 'package:praktikum/screens/contact/contact_view_model.dart';
import 'package:praktikum/screens/dicebear/dicebear_screen.dart';
import 'package:praktikum/screens/dicebear/dicebear_view_model.dart';
import 'package:praktikum/screens/put_request/put_request_screen.dart';
import 'package:praktikum/screens/put_request/put_request_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DiceBearViewModel()),
    ChangeNotifierProvider(create: (context) => ContactViewModel()),
    ChangeNotifierProvider(create: (context) => PutRequestViewmodel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Soal REST API & MVVM',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const DiceBearScreen(),
          '/contact': (context) => const ContactScreen(),
          '/put-request': (context) => const PutRequestScreen(),
        });
  }
}
