import 'package:flutter/material.dart';
import 'package:soal_task_form/model/contact_model.dart';
import 'package:soal_task_form/style/global_text_style.dart';
import 'package:soal_task_form/style/text_color.dart';
import 'package:soal_task_form/widget/global_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soal Task Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nameValue = '';
  String phoneValue = '';

  String nameErrorMsg = '';
  String phoneErrorMsg = '';

  int selectedIndex = -1;

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');

  List<Contact> contactList = [];

  void resetField() {
    nameValue = '';
    phoneValue = '';

    nameController.clear();
    phoneController.clear();

    selectedIndex = -1;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  // CRUD
  void addContact(String name, phone) {
    contactList.add(Contact(name: name, phone: phone));
  }

  void updateContact(int index) {
    contactList[index] = Contact(name: nameValue, phone: phoneValue);
  }

  void deleteContact(int index) {
    contactList.removeAt(index);
  }
  // End of CRUD

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
      body: Column(
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
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GlobalTextField(
                    label: 'Name',
                    hint: 'Insert Your Name',
                    errorMsg: nameErrorMsg,
                    controller: nameController,
                    onChanged: (value) {
                      nameFieldValidator(value);
                    },
                  )),
              const SizedBox(
                height: 14,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GlobalTextField(
                    keyboardType: TextInputType.number,
                      label: 'Phone',
                      hint: '+62 ...',
                      errorMsg: phoneErrorMsg,
                      controller: phoneController,
                      onChanged: (value) {
                        phoneFieldValidator(value);
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 14, right: 20),
                child: ElevatedButton(
                    onPressed: nameValue.isEmpty || phoneValue.isEmpty
                        ? null
                        : () {
                            setState(() {
                              selectedIndex == -1
                                  ? addContact(nameValue, phoneValue)
                                  : updateContact(selectedIndex);
                              resetField();
                            });
                          },
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
          const SizedBox(
            height: 48,
          ),
          Text(
            'List Contacts',
            style: GlobalTextStyle().m3HeadlineSmall,
          ),
          const SizedBox(
            height: 14,
          ),
          Expanded(
            child: Container(
              color: TextColor().m3sysVeryLightPurple,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  itemCount: contactList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(contactList[index].name[0]),
                      ),
                      title: Text(contactList[index].name),
                      subtitle: Text(contactList[index].phone),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                nameController.text = contactList[index].name;
                                phoneController.text = contactList[index].phone;

                                nameValue = contactList[index].name;
                                phoneValue = contactList[index].phone;

                                selectedIndex = index;
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                deleteContact(index);
                              });
                            },
                            icon: const Icon(Icons.delete)),
                      ]),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
