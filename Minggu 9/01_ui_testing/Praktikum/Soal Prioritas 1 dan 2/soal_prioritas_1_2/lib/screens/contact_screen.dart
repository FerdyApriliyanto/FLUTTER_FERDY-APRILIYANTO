import 'package:flutter/material.dart';
import 'package:soal_prioritas_1_2/styles/global_text_style.dart';
import 'package:soal_prioritas_1_2/styles/text_color.dart';
import 'package:soal_prioritas_1_2/widgets/global_text_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String nameValue = '';
  String phoneValue = '';

  String nameErrorMsg = '';
  String phoneErrorMsg = '';

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  // TextField Validator
  void nameFieldValidator(String value) {
    final isContainNumber = RegExp(r'[0-9]').hasMatch(value);
    final isContainSpecialChar =
        RegExp(r'[!@#$%^&*(),.?+=":{}|<>]').hasMatch(value);

    setState(() {
      if (value.isEmpty) {
        nameErrorMsg = 'Nama harus diisi';
      } else if (value.length < 2) {
        nameErrorMsg = 'Nama minimal 2 karakter';
      } else if (value[0].toUpperCase() != value[0]) {
        nameErrorMsg = 'Huruf pertama harus uppercase';
      } else if (isContainNumber) {
        nameErrorMsg = 'Nama tidak boleh mengandung angka';
      } else if (isContainSpecialChar) {
        nameErrorMsg = 'Nama tidak boleh mengandung karakter khusus';
      } else {
        nameValue = value;
        nameErrorMsg = '';
      }
    });
  }

  void phoneFieldValidator(String value) {
    setState(() {
      if (value.isEmpty) {
        phoneErrorMsg = 'No Telp harus diisi';
      } else if (value[0] != '0') {
        phoneErrorMsg = 'No Telp harus dimulai dari angka 0';
      } else if (value.length < 8 || value.length > 15) {
        phoneErrorMsg = 'No Telp minimal 8 digit dan maksimal 15 digit';
        phoneValue = '';
      } else {
        phoneValue = value;
        phoneErrorMsg = '';
      }
    });
  }
  // End of TextField Validator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        backgroundColor: TextColor().m3sysLightPurple,
        foregroundColor: TextColor().m3sysWhite,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Column(children: [
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
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // TextField
                      GlobalTextField(
                        label: 'Name',
                        hint: 'Insert Your Name',
                        errorMsg: nameErrorMsg,
                        controller: nameController,
                        onChanged: (value) {
                          nameFieldValidator(value);
                        },
                      ),
                      const SizedBox(height: 16),
                      GlobalTextField(
                          keyboardType: TextInputType.number,
                          label: 'Phone',
                          hint: '+62 ...',
                          errorMsg: phoneErrorMsg,
                          controller: phoneController,
                          onChanged: (value) {
                            phoneFieldValidator(value);
                          }),
                      // End of TextField
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 14, right: 20),
                child: ElevatedButton(
                    onPressed:
                        nameValue.isEmpty || phoneValue.isEmpty ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TextColor().m3sysLightPurple,
                      disabledForegroundColor:
                          TextColor().m3sysWhite.withOpacity(0.42),
                      disabledBackgroundColor:
                          TextColor().m3sysLightPurple.withOpacity(0.20),
                    ),
                    child: Text(
                      'Submit',
                      style: GlobalTextStyle().m3LabelLarge,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
