import 'package:flutter/material.dart';
import 'package:soal_eksplorasi/pages/favorite_page.dart';
import 'package:soal_eksplorasi/pages/information_page.dart';
import 'package:soal_eksplorasi/routes/routes_nav.dart';
import 'package:soal_eksplorasi/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Soal Eksplorasi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesNav().favoritePage,
        routes: {
          RoutesNav().favoritePage: (_) => const FavoritePage(),
          RoutesNav().searchPage: (_) => const SearchPage(),
          RoutesNav().informationPage: (_) => const InformationPage(),
        });
  }
}
