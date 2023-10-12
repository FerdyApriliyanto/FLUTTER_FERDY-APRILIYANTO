import 'package:flutter/material.dart';
import 'package:project/colors/global_color.dart';
import 'package:project/styles/global_text_style.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: GlobalColor().primaryColor),
                child: Row(
                  children: [
                    const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35,
                        child: Icon(size: 45, Icons.person)),
                    const SizedBox(width: 20),
                    Text(
                      'User',
                      style: GlobalTextStyle().drawerTitleStyle,
                    )
                  ],
                )),
            ListTile(
              leading: const Icon(color: Colors.black, Icons.contact_page),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Contact Us',
                        style: TextStyle(color: Colors.black))),
              ),
            ),
            ListTile(
              leading: const Icon(color: Colors.black, Icons.person),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('About Us',
                        style: TextStyle(color: Colors.black))),
              ),
            ),
            ListTile(
              leading: const Icon(color: Colors.black, Icons.login),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text('Login', style: TextStyle(color: Colors.black))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
