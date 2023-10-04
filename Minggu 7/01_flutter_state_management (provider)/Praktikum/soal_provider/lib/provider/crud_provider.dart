import 'package:flutter/material.dart';
import 'package:soal_provider/models/contact_model.dart';

class CrudProvider with ChangeNotifier {
  int _selectedIndex = -1;
  final List<Contact> _contactList = [];

  int get selectedIndex => _selectedIndex;
  List<Contact> get contactList => _contactList;

  void setSelectedIndex(int selectedIndex) {
    _selectedIndex = selectedIndex;
  }

  void addOrUpdateContact(
    String name,
    phone,
    DateTime selectedDate,
    Color colorPicked,
    String fileName,
  ) {
    _selectedIndex == -1
        ? _contactList.add(Contact(
            name: name,
            phone: phone,
            dateTime: selectedDate,
            color: colorPicked,
            fileName: fileName))
        : _contactList[_selectedIndex] = Contact(
            name: name,
            phone: phone,
            dateTime: selectedDate,
            color: colorPicked,
            fileName: fileName);
    _selectedIndex = -1;
    notifyListeners();
  }

  void deleteContact(int index) {
    _contactList.removeAt(index);
    notifyListeners();
  }
}
