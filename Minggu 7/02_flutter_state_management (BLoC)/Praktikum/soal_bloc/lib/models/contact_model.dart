import 'package:flutter/material.dart';

class ContactModel {
  String name;
  String phone;
  DateTime dateTime;
  Color color;
  String fileName;

  ContactModel(
      {required this.name,
      required this.phone,
      required this.dateTime,
      required this.color,
      required this.fileName});
}
