import 'package:flutter/material.dart';

class SimpleCalculatorTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.pink,
    iconTheme: const IconThemeData(color: Colors.pink),
    textTheme: TextSizeTheme,
  );
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.pink,
    textTheme: TextSizeTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.white),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.white),
    ),
  );

  static const TextSizeTheme = TextTheme(
    bodyText2: TextStyle(fontSize: 20.0),
    button: TextStyle(fontSize: 20.0),
  );
}
