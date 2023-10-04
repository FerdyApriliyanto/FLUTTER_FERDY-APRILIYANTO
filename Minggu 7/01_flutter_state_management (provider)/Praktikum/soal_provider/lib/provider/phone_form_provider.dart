import 'package:flutter/material.dart';

class PhoneFormProvider with ChangeNotifier {
  String _phoneValue = '';
  String _phoneErrorMsg = '';
  final TextEditingController _phoneController = TextEditingController();

  String get phoneValue => _phoneValue;
  String get phoneErrorMsg => _phoneErrorMsg;
  TextEditingController get phoneController => _phoneController;

  void resetPhoneValue() {
    _phoneValue = '';
    _phoneController.clear();
  }

  void updatePhoneField(String selectedPhone) {
    _phoneValue = selectedPhone;
    _phoneController.text = selectedPhone;
  }

  void phoneFieldValidator(String value) {
    if (value.isEmpty) {
      _phoneErrorMsg = 'No Telp harus diisi';
    } else if (value[0] != '0') {
      _phoneErrorMsg = 'No Telp harus dimulai dari angka 0';
    } else if (value.length < 8 || value.length > 15) {
      _phoneErrorMsg = 'No Telp minimal 8 digit dan maksimal 15 digit';
      _phoneValue = '';
    } else {
      _phoneValue = value;
      _phoneErrorMsg = '';
    }
    notifyListeners();
  }
}
