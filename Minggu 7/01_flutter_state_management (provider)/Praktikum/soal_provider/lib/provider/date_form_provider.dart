import 'package:flutter/material.dart';

class DateFormProvider with ChangeNotifier {
  DateTime _dateValue = DateTime.now();
  DateTime get dateValue => _dateValue;

  void setDateValue(DateTime selectedDate) {
    _dateValue = selectedDate;
    notifyListeners();
  }

  void openDatePicker(BuildContext context) async {
    final getDatePicker = await showDatePicker(
        context: context,
        initialDate: _dateValue,
        firstDate: DateTime(1970),
        lastDate: DateTime(_dateValue.year + 10));

    if (getDatePicker != null) {
      _dateValue = getDatePicker;
      notifyListeners();
    }
  }
}
