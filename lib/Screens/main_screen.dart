import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobileapp/Screens/akuntab/akun.dart';
import 'package:mobileapp/Screens/dashboard.dart';
import 'package:mobileapp/Screens/drawer.dart';
import 'package:mobileapp/Screens/market.dart';
import 'package:mobileapp/Variables/responsive.dart';
import 'package:mobileapp/Screens/top_bar_contents.dart';

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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: ResponsiveWidget.isSmallScreen(context)?
      AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'UI Mobile-Staff',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        centerTitle: true,
        // backgroundColor: Colors.yellow[200],
      ):PreferredSize(
        preferredSize: Size(screenSize.width,150),
        child: TopBarContents(),
        ),
      body:DashboardScreen(),
    );
  }
}

