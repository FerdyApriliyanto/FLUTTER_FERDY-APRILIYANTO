import 'package:flutter/material.dart';
import 'package:project/styles/global_text_style.dart';

class CardWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  final String description;

  const CardWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          child: Column(
            children: [
              icon,
              Text(
                title,
                textAlign: TextAlign.center,
                style: GlobalTextStyle().cardTitleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: GlobalTextStyle().cardDescriptionStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
