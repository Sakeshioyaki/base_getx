import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColor = Color(0xFF2D2851);
  static const Color colorBlue = Color(0xFF3658C7);
  static const Color buttonColorGrey = Color(0xFFA8A8A8);
  static const Color mainColorOrange = Color(0xFFed673a);
  static const Color backgroundColor = Color.fromRGBO(220, 220, 220, 1.0);
  static const Color subTextColor = Color(0xFF1B1B1B);

  static const ColorScheme lightScheme = ColorScheme.light(
    primary: backgroundColor,
    secondary: subTextColor,
    background: backgroundColor,
  );
  static const ColorScheme darkScheme = ColorScheme.dark(
    primary: backgroundColor,
    secondary: subTextColor,
    background: backgroundColor,
  );
}
