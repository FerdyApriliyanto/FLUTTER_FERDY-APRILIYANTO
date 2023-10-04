import 'package:flutter/material.dart';

class Contact {
  String name;
  String phone;
  DateTime dateTime;
  Color color;
  String fileName;

  Contact(
      {required this.name,
      required this.phone,
      required this.dateTime,
      required this.color,
      required this.fileName});
}
