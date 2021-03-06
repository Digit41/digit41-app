import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xffA8F358);

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0x0A0A0ACC),
      selectedItemColor: primaryColor,
    )
  );
}
