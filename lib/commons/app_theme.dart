import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // textTheme: DTextTheme.lightTextTheme,
    useMaterial3: true,
    // colorSchemeSeed: ColorScheme.fromSeed,
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // textTheme: DTextTheme.darkTextTheme,
    useMaterial3: true,
    // colorSchemeSeed: const Color(0xFFF55050),
  );
}