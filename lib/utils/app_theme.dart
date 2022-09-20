import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xffA8F358);
  static const grey = Color(0xff292929);

  static const _materialPrimaryColor = {
    50: Color.fromRGBO(168, 243, 88, .1),
    100: Color.fromRGBO(168, 243, 88, .2),
    200: Color.fromRGBO(168, 243, 88, .3),
    300: Color.fromRGBO(168, 243, 88, .4),
    400: Color.fromRGBO(168, 243, 88, .5),
    500: Color.fromRGBO(168, 243, 88, .6),
    600: Color.fromRGBO(168, 243, 88, .7),
    700: Color.fromRGBO(168, 243, 88, .8),
    800: Color.fromRGBO(168, 243, 88, .9),
    900: Color.fromRGBO(168, 243, 88, 1),
  };

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primarySwatch: const MaterialColor(0xffA8F358, _materialPrimaryColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(size: 14.0),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
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
