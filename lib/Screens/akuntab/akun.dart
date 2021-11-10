import 'package:flutter/material.dart';
import 'package:mobileapp/Screens/drawer.dart';
import 'package:mobileapp/Screens/login.dart';
import 'package:mobileapp/Variables/global.dart';
import 'package:mobileapp/Models/news.dart';
import 'package:mobileapp/Models/pages.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:mobileapp/Screens/akuntab/menu_akun.dart';

class AkunScreen extends StatefulWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  _AkunScreenState createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
              child: Text(
                'nama',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            ProfileMenu(
              text: "Data diri",
              press: () {},
            ),
            ProfileMenu(
              text: "Status kepegawaian",
              press: () {},
            ),
            ProfileMenu(
              text: "Karir",
              press: () {},
            ),
            ProfileMenu(
              text: "Pendidikan",
              press: () {},
            ),
          ],
        ),
      )
    );
  }
}
