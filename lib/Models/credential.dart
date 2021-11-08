import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Credential {
  static const key = "credential-";
  bool _isLogin = false;
  bool rememberMe = true;
  String username = "";
  String password = "";
  String cookie = "";

  bool get isLogin =>
      rememberMe && _isLogin && username.isNotEmpty && password.isNotEmpty;

  Future<bool> getCredential() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _isLogin = prefs.getBool(key + "is-login") ?? false;
      rememberMe = prefs.getBool(key + "remember-me") ?? true;
      username = prefs.getString(key + "username") ?? "";
      password = prefs.getString(key + "password") ?? "";
      return true;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> saveCredential() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key + "remember-me", rememberMe);
      await prefs.setBool(key + "is-login", _isLogin);
      await prefs.setString(key + "username", username);
      await prefs.setString(key + "password", password);
      debugPrint("Saved $username | $password");
      return true;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> refresh() async {
    return await login();
  }

  Future<bool> login({String? username, String? password}) async {
    try {
      final resp = await http
          .post(Uri.parse('https://sipeg.ui.ac.id/ng/otorisasi/login'), body: {
        'mode': 'normal',
        'username': username ?? this.username,
        'passwd': password ?? this.password,
        'submit': 'commit'
      });
      if (resp.statusCode == 302) {
        if (resp.headers["set-cookie"] == null) {
          return false;
        } else {
          cookie = resp.headers["set-cookie"] ?? "";
          debugPrint("Cookie : $cookie");
        }
        _isLogin = true;
        this.username = username ?? this.username;
        this.password = password ?? this.password;

        return await saveCredential();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> logout() async {
    try {
      final resp = await http.get(
          Uri.parse('https://sipeg.ui.ac.id/ng/otorisasi/logout'),
          headers: {"cookie": cookie});
      if (resp.statusCode == 302 || resp.statusCode == 200) {
        _isLogin = false;
        if (!rememberMe) {
          username = "";
          password = "";
        }
        return await saveCredential();
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return false;
  }
}
