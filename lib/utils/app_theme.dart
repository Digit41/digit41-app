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
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
    ),
  );

  static double ssFontSize = 9.0;
  static double sFontSize = 12.0;
  static double mFontSize = 15.0;
  static double lFontSize = 18.0;
}
