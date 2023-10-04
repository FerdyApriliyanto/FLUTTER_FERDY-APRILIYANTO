import 'package:flutter/material.dart';

class NameFormProvider with ChangeNotifier {
  String _nameValue = '';
  String _nameErrorMsg = '';
  final TextEditingController _nameController = TextEditingController();

  String get nameValue => _nameValue;
  String get nameErrorMsg => _nameErrorMsg;
  TextEditingController get nameController => _nameController;

  void resetNameValue() {
    _nameValue = '';
    _nameController.clear();
  }

  void updateNameField(String selectedName) {
    _nameValue = selectedName;
    _nameController.text = selectedName;
  }

  void nameFieldValidator(String value) {
    final isContainNumber = RegExp(r'[0-9]').hasMatch(value);
    final isContainSpecialChar =
        RegExp(r'[!@#$%^&*(),.?+=":{}|<>]').hasMatch(value);

    if (value.isEmpty) {
      _nameErrorMsg = 'Nama harus diisi';
    } else if (value.length < 2) {
      _nameErrorMsg = 'Nama minimal 2 karakter';
    } else if (value[0].toUpperCase() != value[0]) {
      _nameErrorMsg = 'Huruf pertama harus uppercase';
    } else if (isContainNumber) {
      _nameErrorMsg = 'Nama tidak boleh mengandung angka';
    } else if (isContainSpecialChar) {
      _nameErrorMsg = 'Nama tidak boleh mengandung karakter khusus';
    } else {
      _nameValue = value;
      _nameErrorMsg = '';
    }
    notifyListeners();
  }
}
