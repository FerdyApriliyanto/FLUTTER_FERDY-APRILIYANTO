import 'package:flutter/material.dart';
import 'package:project/styles/global_text_style.dart';
import 'package:project/widgets/text_field_widget.dart';

class ContactScreenFormSection extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const ContactScreenFormSection(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.messageController});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.person),
                                    Text(
                                      'Fullname: ',
                                      style: GlobalTextStyle().dataTitleStyle,
                                    ),
                                    Text(
                                        '${firstNameController.text} ${lastNameController.text}')
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.email),
                                    Text(
                                      'Email: ',
                                      style: GlobalTextStyle().dataTitleStyle,
                                    ),
                                    Text(emailController.text)
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.message_sharp),
                                    Text(
                                      'Message: ',
                                      style: GlobalTextStyle().dataTitleStyle,
                                    ),
                                    Flexible(
                                        child: Text(messageController.text))
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
    );
  }
}
