import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_storage/models/contact_model.dart';
import 'package:soal_storage/models/db_manager.dart';
import 'package:soal_storage/screens/contact/contact_provider.dart';
import 'package:soal_storage/screens/contact/sections/contact_welcome_section.dart';
import 'package:soal_storage/styles/global_text_style.dart';
import 'package:soal_storage/styles/text_color.dart';
import 'package:soal_storage/widgets/global_text_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');

  late SharedPreferences loginData;
  String? username;
  int currentContactLength = 0;

  @override
  void initState() {
    getUsername();
    getContactLength();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  void getUsername() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username');
    });
  }

  void getContactLength() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      currentContactLength = loginData.getInt('contactLength')! + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dbManagerProvider = Provider.of<DbManager>(context, listen: false);

    final contactProviderNotListening =
        Provider.of<ContactProvider>(context, listen: false);
    final contactProviderListening = Provider.of<ContactProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              loginData = await SharedPreferences.getInstance();
              loginData.setBool('isLoggedIn', false);
              loginData.remove('username');
              loginData.setInt('contactLength', 0);

              if (mounted) {
                dbManagerProvider.deleteAllContact();
                Navigator.pushReplacementNamed(context, '/');
              }
            }),
        title: const Text('Contacts'),
        centerTitle: true,
        backgroundColor: TextColor().m3sysLightPurple,
        foregroundColor: TextColor().m3sysWhite,
      ),
      body: ListView(
        children: [
          ContactWelcomeSection(username: username ?? 'User'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Consumer<ContactProvider>(
                    builder: (context, contactProvider, child) => Column(
                      children: [
                        // TextField
                        GlobalTextField(
                          label: 'Name',
                          hint: 'Insert Your Name',
                          errorMsg: contactProvider.nameErrorMsg,
                          controller: nameController,
                          onChanged: (value) {
                            contactProviderNotListening
                                .nameFieldValidator(value);
                          },
                        ),
                        const SizedBox(height: 16),
                        GlobalTextField(
                            keyboardType: TextInputType.number,
                            label: 'Phone',
                            hint: '+62 ...',
                            errorMsg: contactProvider.phoneErrorMsg,
                            controller: phoneController,
                            onChanged: (value) {
                              contactProviderNotListening
                                  .phoneFieldValidator(value);
                            }),
                        // End of TextField
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 14, right: 20),
                child: ElevatedButton(
                    onPressed: contactProviderListening.nameErrorMsg ==
                                'success' &&
                            contactProviderListening.phoneErrorMsg ==
                                'success' &&
                            nameController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty
                        ? contactProviderListening.selectedIndex == -1
                            ? () async {
                                loginData =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  loginData.setInt(
                                      'contactLength', currentContactLength++);
                                });
                                if (mounted) {
                                  dbManagerProvider.addContact(ContactModel(
                                      id: currentContactLength,
                                      name: nameController.text,
                                      phone: phoneController.text));
                                  nameController.clear();
                                  phoneController.clear();
                                  contactProviderNotListening.resetField();
                                }
                              }
                            : () {
                                dbManagerProvider.updateContact(
                                    ContactModel(
                                        id: contactProviderNotListening
                                            .selectedIndex,
                                        name: nameController.text,
                                        phone: phoneController.text),
                                    contactProviderNotListening.selectedIndex);
                                nameController.clear();
                                phoneController.clear();
                                contactProviderNotListening.resetField();
                              }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TextColor().m3sysLightPurple,
                      disabledForegroundColor:
                          TextColor().m3sysWhite.withOpacity(0.42),
                      disabledBackgroundColor:
                          TextColor().m3sysLightPurple.withOpacity(0.20),
                    ),
                    child: Text(
                      contactProviderListening.selectedIndex == -1
                          ? 'Submit'
                          : 'Update',
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
            textAlign: TextAlign.center,
            style: GlobalTextStyle().m3HeadlineSmall,
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            color: TextColor().m3sysVeryLightPurple,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Consumer<DbManager>(
              builder: (context, value, child) => ListView.builder(
                  itemCount: value.contactModels.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = value.contactModels[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(data.name[0]),
                      ),
                      title: Text(data.name),
                      subtitle: Text(data.phone),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                            onPressed: () {
                              contactProviderNotListening.updateField(data.id);
                              nameController.text = data.name;
                              phoneController.text = data.phone;
                              // debugPrint(selectedIndex.toString());
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              dbManagerProvider.deleteContact(data.id);
                              // Provider.of<DbManager>(context, listen: false)
                              //     .deleteAllContact();
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
