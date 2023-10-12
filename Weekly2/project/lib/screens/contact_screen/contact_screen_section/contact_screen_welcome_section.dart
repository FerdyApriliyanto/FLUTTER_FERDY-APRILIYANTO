import 'package:flutter/material.dart';
import 'package:project/styles/global_text_style.dart';

class ContactScreenWelcomeSection extends StatelessWidget {
  const ContactScreenWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Image.asset('assets/welcome.jpg'),
          Text('Welcome!', style: GlobalTextStyle().titleStyle),
          const SizedBox(height: 14),
          Text(
            "With user-friendly features and a sleek design, we've tailored this app to suit your needs. Explore, create, and achieve more than ever before.",
            style: GlobalTextStyle().subtitleStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
