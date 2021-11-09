import 'package:flutter/material.dart';
import 'package:mobileapp/Models/credential.dart';

class CustomColors {
  Color yellow = const Color.fromRGBO(247, 212, 23, 1); //#F7D417
}

class Global {
  static Credential credential = Credential();
  static CustomColors colors = CustomColors();
  static void snackbar(BuildContext context, String msg,
      {Duration duration = const Duration(seconds: 1),
        SnackBarAction? action}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), action: action, duration: duration));
  }
}
