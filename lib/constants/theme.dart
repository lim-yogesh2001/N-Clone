import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontFamily: "RobotoCondensed-Bold",
            fontSize: 24.0,
            color: Colors.white),
        titleMedium: TextStyle(
            fontFamily: "RobotoCondensed-Regular",
            fontSize: 18.0,
            color: Colors.white),
        titleSmall: TextStyle(
            fontFamily: "RobotoCondensed-Light",
            fontSize: 16.0,
            color: Colors.white),
        bodyMedium: TextStyle(
            fontFamily: "Rubik-Regular", fontSize: 13.0, color: Colors.white),
        bodySmall: TextStyle(
            fontFamily: 'Rubik', fontSize: 12.0, color: Colors.white54)),
    fontFamily: 'Rubik',
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Rubik',
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontFamily: "RobotoCondensed-Bold",
            fontSize: 24.0,
            color: Colors.black87),
        titleMedium: TextStyle(
            fontFamily: "RobotoCondensed-Regular",
            fontSize: 18.0,
            color: Colors.black87),
        titleSmall: TextStyle(
            fontFamily: "RobotoCondensed-Light",
            fontSize: 16.0,
            color: Colors.black87),
        bodyMedium: TextStyle(
            fontFamily: "Rubik-Regular", fontSize: 13.0, color: Colors.white),
        bodySmall: TextStyle(
            fontFamily: 'Rubik', fontSize: 12.0, color: Colors.black54)),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
