import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData(primarySwatch: Colors.deepPurple, appBarTheme: AppBarTheme());
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}
