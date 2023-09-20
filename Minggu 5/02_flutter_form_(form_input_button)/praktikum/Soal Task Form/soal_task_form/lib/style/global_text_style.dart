import 'package:flutter/material.dart';
import 'package:soal_task_form/style/text_color.dart';

class GlobalTextStyle {
  TextStyle m3HeadlineSmall = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 24,
  );

  TextStyle m3BodyMedium = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  TextStyle m3LabelLarge = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: TextColor().m3sysWhite);
}
