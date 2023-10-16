import 'package:flutter/material.dart';
import 'package:praktikum/models/api/dicebear_api.dart';

class DiceBearViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _imageGenerated = '';
  String get imageGenerated => _imageGenerated;

  final TextEditingController _styleController = TextEditingController();
  TextEditingController get styleController => _styleController;

  final TextEditingController _seedController = TextEditingController();
  TextEditingController get seedController => _seedController;

  void generateImage() async {
    _isLoading = true;
    notifyListeners();

    _imageGenerated = await DiceBearApi().generateImage(
        style: _styleController.text, seed: _seedController.text);

    _isLoading = false;
    notifyListeners();
  }
}
