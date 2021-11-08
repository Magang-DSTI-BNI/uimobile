import 'package:flutter/material.dart';
import 'package:mobileapp/credential.dart';

class CustomColors {
  Color yellow = const Color.fromRGBO(247, 212, 23, 1); //#F7D417
}

class Global {
  static Credential credential = Credential();
  static CustomColors colors = CustomColors();
}
