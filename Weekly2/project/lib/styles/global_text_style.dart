import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTextStyle {
  TextStyle titleStyle =
      GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 26);

  TextStyle drawerTitleStyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white);

  TextStyle subtitleStyle = GoogleFonts.roboto(fontSize: 14);

  TextStyle dataTitleStyle =
      GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18);

  TextStyle cardTitleStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  TextStyle cardDescriptionStyle = GoogleFonts.roboto(
    fontSize: 12,
  );
}
