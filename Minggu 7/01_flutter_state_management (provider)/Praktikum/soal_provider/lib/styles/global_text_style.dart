import 'package:flutter/material.dart';
import 'package:soal_provider/styles/global_text_color.dart';

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
      color: GlobalTextColor().m3sysWhite);

  TextStyle drawerTitleStyle = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: GlobalTextColor().m3sysWhite);
}
