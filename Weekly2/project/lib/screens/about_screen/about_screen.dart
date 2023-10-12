import 'package:flutter/material.dart';
import 'package:project/colors/global_color.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
          centerTitle: true,
          backgroundColor: GlobalColor().primaryColor,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('About Screen'),
        ));
  }
}
