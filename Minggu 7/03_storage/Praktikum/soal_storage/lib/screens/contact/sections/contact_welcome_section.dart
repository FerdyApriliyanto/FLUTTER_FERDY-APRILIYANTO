import 'package:flutter/material.dart';
import 'package:soal_storage/styles/global_text_style.dart';

class ContactWelcomeSection extends StatelessWidget {
  final String username;

  const ContactWelcomeSection({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(children: [
        Text(
          'Welcome $username!',
          style: GlobalTextStyle().welcomeText,
        ),
        const SizedBox(
          height: 60,
        ),
        const Icon(size: 24, Icons.smartphone),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Create New Contacts',
          style: GlobalTextStyle().m3HeadlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
            textAlign: TextAlign.left,
            style: GlobalTextStyle().m3BodyMedium,
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made'),
        const SizedBox(
          height: 10,
        ),
        const Divider()
      ]),
    );
  }
}
