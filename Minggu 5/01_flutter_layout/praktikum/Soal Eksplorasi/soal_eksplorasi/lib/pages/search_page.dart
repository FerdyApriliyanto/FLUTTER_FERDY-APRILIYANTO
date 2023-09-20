import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Page'),
          centerTitle: true,
          backgroundColor: const Color(0xFF6200EE),
          foregroundColor: const Color(0xFFFFFFFF),
        ),
        body: const Center(
          child: Text('This is Search Page'),
        ));
  }
}
