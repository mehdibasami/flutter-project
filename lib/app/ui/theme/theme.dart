import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Vazir',
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
    scrollbarTheme: ScrollbarThemeData(
      isAlwaysShown: true,
      radius: const Radius.circular(4),
      trackColor: MaterialStateProperty.all(Colors.grey.shade500),
    ),
  );
}
