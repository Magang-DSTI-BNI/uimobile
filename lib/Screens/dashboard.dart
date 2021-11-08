import 'package:flutter/material.dart';
import 'package:mobileapp/Screens/login.dart';
import 'package:mobileapp/global.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreen();
  }
}

class _DashboardScreen extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selamat Datang"),
      ),
      body: Center(
        child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))))),
            onPressed: () {
              Global.credential.logout().then((value) => Navigator.of(context)
                  .pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen())));
            },
            child: const Text(
              "Keluar",
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }
}
