import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primary = Colors.green;
  static final Color primaryHover = Colors.green.shade600;

  static final ThemeData defaultTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey,
    appBarTheme: const AppBarTheme(backgroundColor: primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: primary, foregroundColor: Colors.lightBlueAccent)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent, foregroundColor: primary)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary, foregroundColor: Colors.amber),
    listTileTheme: const ListTileThemeData(iconColor: primary),
  );
}
