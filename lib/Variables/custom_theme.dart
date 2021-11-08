import 'package:flutter/material.dart';
import 'package:mobileapp/Variables/global.dart';

class CustomTheme {
  static ThemeData light(BuildContext context) => ThemeData(
      primaryColor: Global.colors.yellow,
      brightness: Brightness.light,
      fontFamily: 'PlusJakartaSans',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.black,
        color: Global.colors.yellow,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Global.colors.yellow,
      ),
      colorScheme: ColorScheme.light(
        primary: Global.colors.yellow,
      ));
  static ThemeData dark(BuildContext context) => ThemeData(
      primaryColor: Global.colors.yellow,
      brightness: Brightness.dark,
      fontFamily: 'PlusJakartaSans',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.dark(
        primary: Global.colors.yellow,
      ));
}
