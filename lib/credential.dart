import 'package:shared_preferences/shared_preferences.dart';

class Credential {
  static const key = "credential-";
  bool _isLogin = false;
  bool rememberMe = true;
  String username = "";
  String password = "";

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
      return false;
    }
  }

  Future<bool> saveCredential() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key + "remember-me", rememberMe);
      await prefs.setBool(key + "is-login", _isLogin);
      await prefs.setString(key + "username", username);
      await prefs.setString(key + "password", password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login() async {
    _isLogin = true;
    return true;
  }

  Future<bool> logout() async {
    _isLogin = false;
    rememberMe = true;
    username = "";
    password = "";
    saveCredential();
    return true;
  }
}
