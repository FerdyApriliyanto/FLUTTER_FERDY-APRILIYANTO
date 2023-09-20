# summary

1. MaterialApp merupakan widget dasar untuk membangun aplikasi dengan environment style Android dan biasa menampung beberapa Scaffold. Untuk menggunakan MaterialApp kita harus mengimport package 'package:flutter/material.dart'.

- Contoh pendeklarasian MaterialApp dengan tema default Android dark

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Style',
      theme: ThemeData(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: MaterialHome(),
    );
  }
}
```

2. CupertinoApp merupakan widget dasar untuk membangun aplikasi dengan environment style iOS dan biasa menampung beberapa CupertinoPageScaffold. Untuk menggunakan CupertinoPageScaffold kita harus mengimport package 'package:flutter/cupertino.dart'.

- Contoh pendeklarasian CupertinoApp untuk membuat tampilan style iOS dengan tema dark

```dart
class MyApp extends StatelessWidget {
  final _themeDark = const CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null, null);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino Style',
      theme: _themeDark,
      home: const CupertinoHome(),
    );
  }
}
```

3. Selain perbedaan style platform masing-masing OS, MaterialApp dan CupertinoApp juga memiliki beberapa perbedaan seperti komponen constructor yang digunakan. Contoh di dalam MaterialApp kita dapat menggunakan AppBar, FloatingActionButton dan BottomNavigationBar dan menggunakan Scaffold untuk membuat page, Sedangkan CupertinoApp menggunakan CupertinoNavigationBar untuk membuat app barnya dan CupertinoPageScaffold untuk membuat pagenya.
