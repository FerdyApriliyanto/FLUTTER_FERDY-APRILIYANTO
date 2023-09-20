import 'package:flutter/material.dart';
import 'package:soal_eksplorasi/routes/routes_nav.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> courses = [
    "Flutter",
    "ReactJS",
    "VueJS",
    "Tailwind CSS",
    "UI/UX",
    "Figma",
    "Digital Marketing"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        centerTitle: true,
        backgroundColor: const Color(0xFF6200EE),
        foregroundColor: const Color(0xFFFFFFFF),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Learn ${courses[index]}',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: courses.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF03DAC5),
          shape: const CircleBorder(),
          child: const Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6200EE),
        selectedItemColor: const Color(0xFFFFFFFF),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesNav().favoritePage);
                  },
                  icon: const Icon(Icons.favorite)),
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesNav().searchPage);
                  },
                  icon: const Icon(Icons.search)),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesNav().informationPage);
                  },
                  icon: const Icon(Icons.info)),
              label: 'Information')
        ],
      ),
    );
  }
}
