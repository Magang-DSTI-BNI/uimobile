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

class _MainScreenState extends State<MainScreen> {
  int pageIndex=0;
  List<Widget> pageList=<Widget>[
    DashboardScreen(),
    MarketScreen(),
    AkunScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'UI Mobile-Staff',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
      ),
      body:pageList[pageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[100],
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.yellow[500]!,
              hoverColor: Colors.yellow[300]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.yellow[300]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Beranda',
                ),
                GButton(
                  icon: LineIcons.alternateStore,
                  text: 'Market',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Akun',
                ),
              ],
              selectedIndex: pageIndex,
              onTabChange: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

