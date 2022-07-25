import 'package:digit41/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digit41',
      theme: AppTheme.theme,
      home: const Splash(),
    );
  }
}
