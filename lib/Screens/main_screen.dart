import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobileapp/Screens/akuntab/akun.dart';
import 'package:mobileapp/Screens/dashboard.dart';
import 'package:mobileapp/Screens/drawer.dart';
import 'package:mobileapp/Screens/market.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
            child: AkunScreen()
        ),
      ),
    );
  }
}

