import 'package:flutter/material.dart';

class DetailGalleryScreen extends StatelessWidget {
  const DetailGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final parameter = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Gallery'),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Center(child: Image.asset(parameter)));
  }
}
