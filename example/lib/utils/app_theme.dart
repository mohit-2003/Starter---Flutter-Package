import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light(useMaterial3: true);
  }

  static ThemeData darkTheme() {
    return ThemeData.dark(useMaterial3: true);
  }
}
