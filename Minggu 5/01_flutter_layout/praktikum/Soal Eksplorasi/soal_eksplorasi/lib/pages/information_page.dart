import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Information Page'),
          centerTitle: true,
          backgroundColor: const Color(0xFF6200EE),
          foregroundColor: const Color(0xFFFFFFFF),
        ),
        body: const Center(
          child: Text('This is Information Page'),
        ));
  }
}
