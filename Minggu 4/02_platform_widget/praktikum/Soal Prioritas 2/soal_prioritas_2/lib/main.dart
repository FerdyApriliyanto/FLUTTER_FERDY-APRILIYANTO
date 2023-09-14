import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final _themeDark = const CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null, null);
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Soal Prioritas 2',
      theme: _themeDark,
      home: const CupertinoHome(),
    );
  }
}

class CupertinoHome extends StatelessWidget {
  const CupertinoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('CupertinoApp')),
        child: Center(
          child: Text('This is Cupertino App'),
        ));
  }
}
