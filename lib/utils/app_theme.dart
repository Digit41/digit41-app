import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xffA8F358);
  static const grey = Color(0xff292929);

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
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
    textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor),
  );

  static double ssFontSize = 9.0;
  static double sFontSize = 12.0;
  static double mFontSize = 15.0;
  static double lFontSize = 18.0;
}
