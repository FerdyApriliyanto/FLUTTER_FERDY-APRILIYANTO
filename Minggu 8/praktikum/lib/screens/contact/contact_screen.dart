import 'package:flutter/material.dart';
import 'package:praktikum/screens/contact/contact_view_model.dart';
import 'package:praktikum/widgets/button_widget.dart';
import 'package:praktikum/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void openDialog(
      {required BuildContext context,
      required String title,
      required List<Widget> content}) {
    showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: content),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final contactProviderNotListening =
        Provider.of<ContactViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact'),
          centerTitle: true,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: 'Name',
                  controller: contactProviderNotListening.nameController),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: 'Phone',
                  controller: contactProviderNotListening.phoneController),
              const SizedBox(
                height: 20,
              ),

              // SOAL PRIORITAS 1 No. 1
              ButtonWidget(
                  onPressed: () {
                    contactProviderNotListening.postData();
                    openDialog(
                        context: context,
                        title: 'Create Contact',
                        content: [
                          Consumer<ContactViewModel>(
                              builder: (context, value, child) =>
                                  value.statusCode == '201'
                                      ? const Text('Data created successfuly!')
                                      : const Text('Sending data...'))
                        ]);
                  },
                  label: 'POST Data'),

              // SOAL PRIORITAS 1 No. 2
              ButtonWidget(
                  onPressed: () {
                    contactProviderNotListening.getData();
                    openDialog(
                        context: context,
                        title: 'Get Contact',
                        content: [
                          Consumer<ContactViewModel>(
                            builder: (context, value, child) => value
                                        .contact2.id ==
                                    0
                                ? const Text('Fetching data...')
                                : Column(
                                    children: [
                                      Text('ID: ${value.contact2.id}'),
                                      Text('Name: ${value.contact2.name}'),
                                      Text('Phone: ${value.contact2.phone}'),
                                    ],
                                  ),
                          )
                        ]);
                  },
                  label: 'GET Data Contact 2'),
            ],
          ),
        ));
  }
}
