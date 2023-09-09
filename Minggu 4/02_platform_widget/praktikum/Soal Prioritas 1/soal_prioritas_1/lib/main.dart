import 'package:flutter/material.dart';
import 'package:soal_prioritas_1/model_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soal Prioritas 1',
      theme: ThemeData(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final List<Contact> contacts = [
    Contact(name: 'Leanne Graham', phone: '1-770-736-8031 x56442'),
    Contact(name: 'Ervin Howell', phone: '010-692-6593 x09125'),
    Contact(name: 'Clementine Bauch', phone: '1-463-123-4447'),
    Contact(name: 'Patricia Lebsack', phone: '493-170-9623 x156'),
    Contact(name: 'Chelsey Dietrich', phone: '(254)954-1289'),
    Contact(name: 'Mrs. Dennis Schulist', phone: '1-447=935-8478 x6430'),
    Contact(name: 'Kurtis Weissnat', phone: '210 067 6132'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('MaterialApp'),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100)),
                child: const Center(child: Text('T'))),
            title: const Text('Name'),
            subtitle: const Text('Phone'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
      drawer: const HomeDrawer(),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child:
          ListView(padding: const EdgeInsets.all(15), children: const <Widget>[
        Text('Home'),
        SizedBox(height: 22),
        Text('Settings'),
      ]),
    ));
  }
}
