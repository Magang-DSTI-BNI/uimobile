import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/Variables/global.dart';

class Page {
  bool _isLoading = true;
  bool _hasError = false;
  final Url _url;
  Page(this._url);
  http.Response? _resp;
  Future<http.Response?> fetch({force = false}) async {
    _isLoading = true;
    _hasError = false;
    try {
      if (_resp != null && !force) {
        debugPrint("$_url Fetched From Internal Cache");
        _isLoading = false;
        return _resp;
      }
      _resp = null;
      var resp = await http
          .get(_url.uri, headers: {"cookie": Global.credential.cookie});
      if (resp.statusCode == 200) {
        if (resp.body.contains(
            "adalah aplikasi berbasis web yang digunakan untuk menunjang proses administrasi")) {
          debugPrint("$_url Request to Refresh");
          if (await Global.credential.refresh()) {
            resp = await http
                .get(_url.uri, headers: {"cookie": Global.credential.cookie});
            if (resp.statusCode != 200) {
              debugPrint("$_url Refresh and Fetched Failed");
              _isLoading = false;
              _hasError = true;
              return _resp;
            } else {
              debugPrint("$_url Refresh Successful");
            }
          } else {
            debugPrint("$_url Refresh and Fetch Failed");
            _isLoading = false;
            _hasError = true;
            return _resp;
          }
        }

        debugPrint("$_url Fetched Successfully");
        _isLoading = false;
        return _resp = resp;
      } else {
        debugPrint("$_url Fetched Failed");
        _isLoading = false;
        _hasError = true;
        return _resp;
      }
    } catch (e) {
      debugPrint("$_url Fetched Failed with Error\n${e.toString()}");
      _isLoading = false;
      _hasError = true;
      return _resp;
    }
  }

  get isLoading => _isLoading;
  get hasError => _hasError;
}

class Pages {
  static Page home = Page(Global.url.main);
}
