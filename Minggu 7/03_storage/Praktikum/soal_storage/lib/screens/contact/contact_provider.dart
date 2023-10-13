import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  String _nameErrorMsg = '';
  String get nameErrorMsg => _nameErrorMsg;

  String _phoneErrorMsg = '';
  String get phoneErrorMsg => _phoneErrorMsg;

  int selectedIndex = -1;

  // TextField Validator
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
      _nameErrorMsg = 'success';
    }
    notifyListeners();
  }

  void phoneFieldValidator(String value) {
    if (value.isEmpty) {
      _phoneErrorMsg = 'No Telp harus diisi';
    } else if (value[0] != '0') {
      _phoneErrorMsg = 'No Telp harus dimulai dari angka 0';
    } else if (value.length < 8 || value.length > 15) {
      _phoneErrorMsg = 'No Telp minimal 8 digit dan maksimal 15 digit';
    } else {
      _phoneErrorMsg = 'success';
    }
    notifyListeners();
  }
  // End of TextField Validator

  void updateField(int index) {
    _nameErrorMsg = 'success';
    _phoneErrorMsg = 'success';
    selectedIndex = index;

    notifyListeners();
  }

  void resetField() {
    selectedIndex = -1;

    notifyListeners();
  }
}
