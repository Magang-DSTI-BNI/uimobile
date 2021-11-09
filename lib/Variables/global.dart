import 'package:flutter/material.dart';
import 'package:mobileapp/Models/credential.dart';

class CustomColors {
  Color yellow = const Color.fromRGBO(247, 212, 23, 1); //#F7D417
}

class Url {
  String str;
  Uri get uri => Uri.parse(str);
  Url(this.str);
  Url append(String url) {
    return Url(str + url);
  }
}

class Urls {
  late Url root;
  late Url login = root.append('/ng/otorisasi/login');
  late Url logout = root.append('/ng/otorisasi/logout');
  late Url main = root.append('/ng/main');
  late Url ping = root.append('/ng/ping');

  Urls({String? root}) {
    this.root = Url(root ?? "https://sipeg.ui.ac.id");
  }
}

class Global {
  static Urls url = Urls(root: "http://192.168.137.50");
  static Credential credential = Credential();
  static CustomColors colors = CustomColors();
  static void snackbar(BuildContext context, String msg,
      {Duration duration = const Duration(seconds: 1),
        SnackBarAction? action}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), action: action, duration: duration));
  }
}
