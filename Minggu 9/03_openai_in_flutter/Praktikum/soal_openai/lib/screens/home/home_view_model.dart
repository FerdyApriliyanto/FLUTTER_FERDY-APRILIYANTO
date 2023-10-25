import 'package:flutter/material.dart';
import 'package:soal_openai/models/api/openai_api.dart';

class HomeViewModel extends ChangeNotifier {
  final _openAIApi = OpenAIApi();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isValidated = false;
  bool get isValidated => _isValidated;

  final TextEditingController _budgetController = TextEditingController();
  TextEditingController get budgetController => _budgetController;

  final TextEditingController _cameraController = TextEditingController();
  TextEditingController get cameraController => _cameraController;

  final TextEditingController _internalStorageController =
      TextEditingController();
  TextEditingController get internalStorageController =>
      _internalStorageController;

  Future<String> getPhoneReccomendation() async {
    _isLoading = true;
    notifyListeners();

    final result = await _openAIApi.getPhoneRecommendation(
        budget: _budgetController.text,
        camera: _cameraController.text,
        internalStorage: _internalStorageController.text);

    _isLoading = false;
    notifyListeners();

    return result;
  }

  void validateTextField() {
    if (_budgetController.text != '' &&
        _cameraController.text != '' &&
        _internalStorageController.text != '') {
      _isValidated = true;
      notifyListeners();
    } else {
      _isValidated = false;
      notifyListeners();
    }
  }
}
