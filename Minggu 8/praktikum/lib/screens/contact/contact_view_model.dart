import 'package:flutter/material.dart';
import 'package:praktikum/models/api/contact_api.dart';
import 'package:praktikum/models/contact_model.dart';

class ContactViewModel extends ChangeNotifier {
  String _statusCode = '';
  String get statusCode => _statusCode;

  ContactModel _contact2 = ContactModel(id: 0, name: '', phone: '');
  ContactModel get contact2 => _contact2;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  // SOAL PRIORITAS 1 No. 1
  void postData() async {
    final postResponse = await ContactApi().postContact(
        dataContact:
            ContactModel(name: nameController.text, phone: phoneController.text)
                .toJson());

    _statusCode = postResponse;
    notifyListeners();
  }

  // SOAL PRIORITAS 1 No. 2
  void getData() async {
    final getResponse = await ContactApi().getContact();

    _contact2 = ContactModel.fromJson(getResponse);
    notifyListeners();
  }
}
