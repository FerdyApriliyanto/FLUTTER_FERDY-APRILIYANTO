import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/styles/global_text_style.dart';
import 'package:project/widgets/text_field_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String firstNameValue = '';
  String lastNameValue = '';
  String emailValue = '';
  String messageValue = '';

  void setController() {
    setState(() {
      firstNameValue = firstNameController.text;
      lastNameValue = lastNameController.text;
      emailValue = emailController.text;
      messageValue = messageController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact',
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w600)),
          centerTitle: true,
          backgroundColor: const Color(0xFF385a64),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
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
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.only(left: 14, right: 14, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Us', style: GlobalTextStyle().titleStyle),
                  const SizedBox(height: 10),
                  Text(
                      "Our dedicated customer support team is available to assist you with any inquiries or problems you may have. We aim to provide prompt and helpful assistance to ensure you have the best experience with our app.",
                      style: GlobalTextStyle().subtitleStyle),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: TextFieldWidget(
                        fieldLabel: 'First Name',
                        fieldController: firstNameController,
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: TextFieldWidget(
                        fieldLabel: 'Last Name',
                        fieldController: lastNameController,
                      ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    fieldLabel: 'Email',
                    fieldController: emailController,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    fieldLabel: 'Message',
                    isTextArea: true,
                    fieldController: messageController,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        setController();
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    'Your Submitted Data',
                                    style: GlobalTextStyle().titleStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: SizedBox(
                                    height: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.person),
                                            Text(
                                              'Fullname: ',
                                              style: GlobalTextStyle()
                                                  .dataTitleStyle,
                                            ),
                                            Text(
                                                '$firstNameValue $lastNameValue')
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(Icons.email),
                                            Text(
                                              'Email: ',
                                              style: GlobalTextStyle()
                                                  .dataTitleStyle,
                                            ),
                                            Text(emailValue)
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(Icons.message_sharp),
                                            Text(
                                              'Message: ',
                                              style: GlobalTextStyle()
                                                  .dataTitleStyle,
                                            ),
                                            Flexible(child: Text(messageValue))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: const Text('Submit')),
                ],
              ),
            ),
          ],
        ));
  }
}
