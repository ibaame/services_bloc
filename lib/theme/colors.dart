import 'package:flutter/material.dart';

final themes = {
  "dark": ThemeData(
    scaffoldBackgroundColor: const Color(0xFF3A3838),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ).apply(bodyColor: Colors.white),
  ),
  "blue": ThemeData(
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.blue),
    appBarTheme: const AppBarTheme(color: Colors.blue),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
    ).apply(bodyColor: Colors.black),
  ),
  "red": ThemeData(
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.red),
    appBarTheme: const AppBarTheme(color: Colors.red),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.red)),
  ),
};
