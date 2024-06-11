import 'package:flutter/material.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
      primaryColor: Colors.black,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white);

  static final darkTheme = ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.dark,
      appBarTheme:
          const AppBarTheme(backgroundColor: Color.fromARGB(255, 48, 48, 48)),
      scaffoldBackgroundColor: Colors.black);
}
