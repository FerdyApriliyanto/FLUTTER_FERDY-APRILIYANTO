import 'package:flutter/material.dart';
import 'package:soal_bloc/styles/global_text_color.dart';
import 'package:soal_bloc/styles/global_text_style.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration:
                    BoxDecoration(color: GlobalTextColor().m3sysLightPurple),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: GlobalTextColor().m3sysWhite,
                        radius: 35,
                        child: const Icon(size: 45, Icons.person)),
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
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Contact',
                        style: TextStyle(
                            color: GlobalTextColor().m3sysLightPurple))),
              ),
            ),
            ListTile(
              leading: const Icon(color: Colors.black, Icons.image),
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gallery');
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Gallery',
                        style: TextStyle(
                            color: GlobalTextColor().m3sysLightPurple))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
