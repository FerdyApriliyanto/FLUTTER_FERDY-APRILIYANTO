import 'package:flutter/material.dart';

class ColorFormProvider with ChangeNotifier {
  Color _colorValue = Colors.black;
  Color get colorValue => _colorValue;

  void setColor(Color color) {
    _colorValue = color;
    notifyListeners();
  }
}
