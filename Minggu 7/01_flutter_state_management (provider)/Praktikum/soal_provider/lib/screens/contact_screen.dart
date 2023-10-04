import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soal_provider/provider/color_form_provider.dart';
import 'package:soal_provider/provider/crud_provider.dart';
import 'package:soal_provider/provider/date_form_provider.dart';
import 'package:soal_provider/provider/file_form_provider.dart';
import 'package:soal_provider/provider/name_form_provider.dart';
import 'package:soal_provider/provider/phone_form_provider.dart';
import 'package:soal_provider/styles/global_text_style.dart';
import 'package:soal_provider/styles/global_text_color.dart';
import 'package:soal_provider/widgets/color_form_widget.dart';
import 'package:soal_provider/widgets/date_form_widget.dart';
import 'package:soal_provider/widgets/drawer_widget.dart';
import 'package:soal_provider/widgets/file_form_widget.dart';
import 'package:soal_provider/widgets/text_field_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameFormProvider = Provider.of<NameFormProvider>(context);
    final phoneFormProvider = Provider.of<PhoneFormProvider>(context);
    final dateFormProvider = Provider.of<DateFormProvider>(context);
    final colorFormProvider = Provider.of<ColorFormProvider>(context);
    final fileFormProvider = Provider.of<FileFormProvider>(context);
    final crudProvider = Provider.of<CrudProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        backgroundColor: GlobalTextColor().m3sysLightPurple,
        foregroundColor: GlobalTextColor().m3sysWhite,
      ),
      drawer: const DrawerWidget(),
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
                  child: Consumer<NameFormProvider>(
                    builder: (context, nameConsumer, child) =>
                        Consumer<PhoneFormProvider>(
                      builder: (context, phoneConsumer, child) => Column(
                        children: [
                          TextFieldWidget(
                            label: 'Name',
                            hint: 'Insert Your Name',
                            errorMsg: nameConsumer.nameErrorMsg,
                            controller: nameConsumer.nameController,
                            onChanged: (value) {
                              nameConsumer.nameFieldValidator(value);
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFieldWidget(
                              keyboardType: TextInputType.number,
                              label: 'Phone',
                              hint: '+62 ...',
                              errorMsg: phoneConsumer.phoneErrorMsg,
                              controller: phoneConsumer.phoneController,
                              onChanged: (value) {
                                phoneConsumer.phoneFieldValidator(value);
                              }),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Column(
                              children: [
                                DateFormWidget(context: context),
                                const SizedBox(height: 16),
                                ColorFormWidget(context: context),
                                const SizedBox(height: 16),
                                FileFormWidget(context: context)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 14, right: 20),
                child: ElevatedButton(
                    onPressed: nameFormProvider.nameValue.isEmpty ||
                            phoneFormProvider.phoneValue.isEmpty
                        ? null
                        : () {
                            crudProvider.addOrUpdateContact(
                                nameFormProvider.nameValue,
                                phoneFormProvider.phoneValue,
                                dateFormProvider.dateValue,
                                colorFormProvider.colorValue,
                                fileFormProvider.fileValue);

                            nameFormProvider.resetNameValue();
                            phoneFormProvider.resetPhoneValue();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalTextColor().m3sysLightPurple,
                      disabledForegroundColor:
                          GlobalTextColor().m3sysWhite.withOpacity(0.42),
                      disabledBackgroundColor:
                          GlobalTextColor().m3sysLightPurple.withOpacity(0.20),
                    ),
                    child: Text(
                      'Submit',
                      style: GlobalTextStyle().m3LabelLarge,
                    )),
              ),
              const SizedBox(
                height: 48,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'List Contacts',
                  style: GlobalTextStyle().m3HeadlineSmall,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                color: GlobalTextColor().m3sysVeryLightPurple,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                    itemCount: crudProvider.contactList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = crudProvider.contactList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(data.name[0]),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(data.name), Text(data.phone)],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Date: ${DateFormat('dd-MM-yyy').format(data.dateTime)}'),
                            Row(
                              children: [
                                const Text('Color: '),
                                Icon(color: data.color, Icons.square),
                              ],
                            ),
                            Text('File: ${data.fileName}'),
                          ],
                        ),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              onPressed: () {
                                nameFormProvider.updateNameField(data.name);
                                phoneFormProvider.updatePhoneField(data.phone);
                                dateFormProvider.setDateValue(data.dateTime);
                                colorFormProvider.setColor(data.color);
                                fileFormProvider.setFileValue(data.fileName);
                                crudProvider.setSelectedIndex(index);
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                crudProvider.deleteContact(index);
                              },
                              icon: const Icon(Icons.delete)),
                        ]),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
