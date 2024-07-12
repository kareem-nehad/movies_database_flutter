import 'package:flutter/material.dart';

class AppDarkThemeData {
  static ThemeData appDarkTheme() {
    return ThemeData(
      useMaterial3: false,
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
      ),
      indicatorColor: Colors.amber,
      fontFamily: 'Avenir'
    );
  }
}
