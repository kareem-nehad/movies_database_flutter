import 'package:flutter/material.dart';

class AppLightThemeData {
  static ThemeData appLightTheme() {
    return ThemeData(
        useMaterial3: false,
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Colors.amber
        ),
        textTheme: const TextTheme(
          // labelLarge: TextStyle(
          //   color: Colors.white,
          // ),
          // labelMedium: TextStyle(
          //   color: Colors.white,
          // ),
          // labelSmall: TextStyle(
          //   color: Colors.white,
          // ),
          bodySmall: TextStyle(
            color: Colors.white,
          ),
          // bodyMedium: TextStyle(
          //   color: Colors.white,
          // ),
          // bodyLarge: TextStyle(
          //   color: Colors.white,
          // ),
          // titleSmall: TextStyle(
          //   color: Colors.white,
          // ),
          // titleMedium: TextStyle(
          //   color: Colors.white,
          // ),
          titleLarge: TextStyle(
            color: Colors.black,
          ),
        ),
        fontFamily: 'Avenir');
  }
}
