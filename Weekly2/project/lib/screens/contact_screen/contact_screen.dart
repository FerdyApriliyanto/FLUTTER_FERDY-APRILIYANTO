import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/colors/global_color.dart';
import 'package:project/screens/contact_screen/contact_screen_section/contact_screen_about_section.dart';
import 'package:project/screens/contact_screen/contact_screen_section/contact_screen_form_section.dart';
import 'package:project/screens/contact_screen/contact_screen_section/contact_screen_welcome_section.dart';
import 'package:project/widgets/drawer_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact',
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w600)),
          centerTitle: true,
          backgroundColor: GlobalColor().primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const DrawerWidget(),
        body: ListView(
          shrinkWrap: true,
          children: [
            const ContactScreenWelcomeSection(),
            const SizedBox(height: 100),
            ContactScreenFormSection(
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
              emailController: _emailController,
              messageController: _messageController,
            ),
            const SizedBox(height: 80),
            const ContactScreenAboutSection(),
            const SizedBox(height: 20),
          ],
        ));
  }
}
