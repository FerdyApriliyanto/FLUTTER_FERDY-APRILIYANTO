import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:soal_bloc/bloc/color_picker/color_picker_bloc.dart';
import 'package:soal_bloc/bloc/crud_contact/crud_contact_bloc.dart';
import 'package:soal_bloc/bloc/date_picker/date_picker_bloc.dart';
import 'package:soal_bloc/bloc/file_picker/file_picker_bloc.dart';
import 'package:soal_bloc/bloc/phone_validator/phone_validator_bloc.dart';

import 'package:soal_bloc/models/contact_model.dart';
import 'package:soal_bloc/styles/global_text_style.dart';
import 'package:soal_bloc/styles/global_text_color.dart';
import 'package:soal_bloc/widgets/color_picker_widget.dart';
import 'package:soal_bloc/widgets/date_picker_widget.dart';
import 'package:soal_bloc/widgets/drawer_widget.dart';
import 'package:soal_bloc/widgets/file_picker_widget.dart';
import 'package:soal_bloc/widgets/text_field_widget.dart';

import '../bloc/name_validator/name_validator_bloc.dart';

// ignore: must_be_immutable
class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  int selectedIndex = -1;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<ContactModel> contact = [
    ContactModel(
        name: '',
        phone: '',
        dateTime: DateTime.now(),
        color: Colors.red,
        fileName: '')
  ];

  @override
  Widget build(BuildContext context) {
    final currentNameValidatorState = context.watch<NameValidatorBloc>().state;
    final currentPhoneValidatorState =
        context.watch<PhoneValidatorBloc>().state;
    final currentDatePickerState = context.watch<DatePickerBloc>().state;
    final currentColorPickerState = context.watch<ColorPickerBloc>().state;
    final currentFilePickerState = context.watch<FilePickerBloc>().state;

    final nameValidatorBloc = context.read<NameValidatorBloc>();
    final phoneValidatorBloc = context.read<PhoneValidatorBloc>();
    final datePickerBloc = context.read<DatePickerBloc>();
    final colorPickerBloc = context.read<ColorPickerBloc>();
    final filePickerBloc = context.read<FilePickerBloc>();
    final crudContactBloc = context.read<CrudContactBloc>();

    DateTime dateTime = currentDatePickerState is DatePickerSelected
        ? currentDatePickerState.selectedDate
        : DateTime.now();
    Color color = currentColorPickerState is ColorPicked
        ? currentColorPickerState.selectedColor
        : Colors.black;
    String fileName = currentFilePickerState is FilePicked
        ? currentFilePickerState.fileName
        : '-';

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
                  child: Column(
                    children: [
                      // TextField
                      BlocBuilder<NameValidatorBloc, NameValidatorState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            label: 'Name',
                            hint: 'Insert Your Name',
                            errorMsg: state is NameValidatorFailed
                                ? state.errorMsg
                                : '',
                            controller: nameController,
                            onChanged: (value) {
                              nameValidatorBloc
                                  .add(NameFieldChanged(nameValue: value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<PhoneValidatorBloc, PhoneValidatorState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                              keyboardType: TextInputType.number,
                              label: 'Phone',
                              hint: '+62 ...',
                              errorMsg: state is PhoneValidatorFailed
                                  ? state.errorMsg
                                  : '',
                              controller: phoneController,
                              onChanged: (value) {
                                phoneValidatorBloc
                                    .add(PhoneFieldChanged(phoneValue: value));
                              });
                        },
                      ),
                      // End of TextField

                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: [
                            DatePickerWidget(context: context),
                            const SizedBox(height: 16),
                            const ColorPickerWidget(),
                            const SizedBox(height: 16),
                            const FilePickerWidget()
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 14, right: 20),
                  child: ElevatedButton(
                      onPressed: currentNameValidatorState
                                  is NameValidatorSuccess &&
                              currentPhoneValidatorState
                                  is PhoneValidatorSuccess
                          ? () {
                              if (selectedIndex == -1) {
                                crudContactBloc.add(CreateContact(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    dateTime: dateTime,
                                    color: color,
                                    fileName: fileName));
                                nameController.clear();
                                phoneController.clear();
                                nameValidatorBloc.add(ResetNameValue());
                                phoneValidatorBloc.add(ResetPhoneValue());
                                datePickerBloc.add(SetDatePicked(
                                    selectedDateTime: DateTime.now()));
                                colorPickerBloc.add(const SetColorPicked(
                                    newColor: Colors.black));
                                context.read<FilePickerBloc>().add(
                                    const SetFilePicked(selectedFileName: ''));
                              } else {
                                crudContactBloc.add(UpdateContact(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    dateTime: dateTime,
                                    color: color,
                                    fileName: fileName,
                                    index: selectedIndex));
                                nameController.clear();
                                phoneController.clear();
                                nameValidatorBloc.add(ResetNameValue());
                                phoneValidatorBloc.add(ResetPhoneValue());
                                datePickerBloc.add(SetDatePicked(
                                    selectedDateTime: DateTime.now()));
                                colorPickerBloc.add(const SetColorPicked(
                                    newColor: Colors.black));
                                context.read<FilePickerBloc>().add(
                                    const SetFilePicked(selectedFileName: ''));
                                selectedIndex = -1;
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalTextColor().m3sysLightPurple,
                        disabledForegroundColor:
                            GlobalTextColor().m3sysWhite.withOpacity(0.42),
                        disabledBackgroundColor: GlobalTextColor()
                            .m3sysLightPurple
                            .withOpacity(0.20),
                      ),
                      child: Text(
                        selectedIndex == -1 ? 'Submit' : 'Update',
                        style: GlobalTextStyle().m3LabelLarge,
                      )))
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
            color: GlobalTextColor().m3sysVeryLightPurple,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<CrudContactBloc, CrudContactState>(
              builder: (context, state) {
                return ListView.builder(
                    itemCount: state.contactList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = state.contactList[index];
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
                                selectedIndex = index;
                                nameController.text = data.name;
                                phoneController.text = data.phone;
                                nameValidatorBloc.add(
                                    UpdateNameValue(selectedName: data.name));
                                phoneValidatorBloc.add(UpdatePhoneValue(
                                    selectedPhone: data.phone));
                                colorPickerBloc
                                    .add(SetColorPicked(newColor: data.color));
                                datePickerBloc.add(SetDatePicked(
                                    selectedDateTime: data.dateTime));
                                filePickerBloc.add(SetFilePicked(
                                    selectedFileName: data.fileName));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                crudContactBloc.add(DeleteContact(id: index));
                              },
                              icon: const Icon(Icons.delete)),
                        ]),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
