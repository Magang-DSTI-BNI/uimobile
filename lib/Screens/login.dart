import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobileapp/Screens/dashboard.dart';
import 'package:mobileapp/global.dart';
import 'package:transparent_image/transparent_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  bool _isLoggingIn = false;
  final _ucController = TextEditingController();
  final _pwController = TextEditingController();

  var _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
            body: FutureBuilder(
                future: Global.credential.getCredential(),
                builder: (context, ss) {
                  if (ss.hasData && Global.credential.isLogin) {
                    setState(() {
                      _ucController.text = Global.credential.username;
                      _pwController.text = Global.credential.password;
                      _isLoggingIn = true;
                    });
                    Global.credential.login().then((value) {
                      setState(() => _isLoggingIn = false);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => DashboardScreen()));
                    });
                  }
                  return Stack(alignment: Alignment.topCenter, children: [
                    SingleChildScrollView(
                        child: Image.asset(
                      'assets\\images\\bg\\login_bg.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    )),
                    Column(children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          "assets\\images\\icons\\logo_original.png",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("UI Mobile - Staff",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                      const SizedBox(
                        height: 15,
                      ),
                    ]),
                    SingleChildScrollView(
                        child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          (ss.hasError)
                              ? const Text(
                                  "Kesalahan",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : (!ss.hasData)
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator())
                                  : Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(25),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        child: Column(
                                          children: [
                                            const Text(
                                                "Masuk dengan akun SIPEG"),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            TextField(
                                              enabled: !_isLoggingIn,
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                hintText: 'Username',
                                                contentPadding:
                                                    EdgeInsets.all(5),
                                              ),
                                              controller: _ucController,
                                            ),
                                            TextField(
                                                enabled: !_isLoggingIn,
                                                textAlign: TextAlign.center,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Password',
                                                  contentPadding:
                                                      EdgeInsets.all(5),
                                                ),
                                                controller: _pwController),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Checkbox(
                                                      value: _rememberMe,
                                                      onChanged: (value) =>
                                                          setState(() =>
                                                              _rememberMe =
                                                                  value ??
                                                                      true)),
                                                  const Text("Ingat saya"),
                                                ]),
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25))),
                                                ),
                                                onPressed: (_isLoggingIn)
                                                    ? null
                                                    : () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        setState(() {
                                                          Global.credential
                                                                  .username =
                                                              _ucController
                                                                  .text;

                                                          Global.credential
                                                                  .password =
                                                              _pwController
                                                                  .text;
                                                          _isLoggingIn = true;
                                                        });
                                                        Global.credential
                                                            .login()
                                                            .then((value) {
                                                          setState(() =>
                                                              _isLoggingIn =
                                                                  false);
                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (_) =>
                                                                              DashboardScreen()));
                                                        });
                                                      },
                                                child: SizedBox(
                                                    width: 100,
                                                    height: 20,
                                                    child: (_isLoggingIn)
                                                        ? const Center(
                                                            child: SizedBox(
                                                                width: 20,
                                                                height: 20,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: Colors
                                                                      .black,
                                                                )))
                                                        : const Text(
                                                            "Masuk",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                          ],
                                        ),
                                      )),
                          const SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    ))
                  ]);
                })));
  }
}
