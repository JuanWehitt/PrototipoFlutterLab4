import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primary = Color.fromARGB(255, 71, 50, 255);
  static const Color primaryHover = Colors.cyan;

  static final ThemeData defaultTheme = ThemeData.light().copyWith(
      primaryColor: Colors.blueGrey,
      appBarTheme: const AppBarTheme(backgroundColor: primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: Colors.lightBlueAccent)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, foregroundColor: primary)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, foregroundColor: Colors.white),
      listTileTheme: const ListTileThemeData(iconColor: primary),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            color: Colors.amber,
          ),
          selectedIconTheme: IconThemeData(
            color: primary,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          )));
}
