import 'package:flutter/material.dart';
import 'package:project/styles/global_text_style.dart';
import 'package:project/widgets/card_widget.dart';

class ContactScreenAboutSection extends StatelessWidget {
  const ContactScreenAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Text(
            'About Us',
            style: GlobalTextStyle().titleStyle,
          ),
          Text(
            'Alterra Academy Programs',
            style: GlobalTextStyle().subtitleStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: CardWidget(
                icon: Icon(Icons.code),
                title: 'Coding Bootcamp',
                description:
                    "Forget the traditional education model that spans years; coding bootcamps condense vast knowledge into a focused curriculum that gets you job-ready.",
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: CardWidget(
                icon: Icon(Icons.store),
                title: 'Digital Marketing',
                description:
                    "Are you ready to unlock the secrets of the digital realm and become a true marketing virtuoso? Welcome to our Digital Marketing Academy program.",
              )),
            ],
          )
        ],
      ),
    );
  }
}
