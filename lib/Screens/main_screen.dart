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

  List<Widget> pageList=<Widget>[
    DashboardScreen(),
    MarketScreen(),
    AkunScreen(),
  ];

 late TabController _controller;
@override
  void initState() {
    _controller=TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {
        print(_controller.index);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   // backgroundColor: Colors.yellow[200],
      // ),
      body:Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
            child: AkunScreen()
        ),
      ),
    );
  }
}

