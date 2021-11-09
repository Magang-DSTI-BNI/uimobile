import 'package:flutter/material.dart';
import 'package:mobileapp/Screens/drawer.dart';
import 'package:mobileapp/Screens/login.dart';
import 'package:mobileapp/Variables/global.dart';
import 'package:mobileapp/Models/news.dart';
import 'package:mobileapp/Models/pages.dart';
import 'package:mobileapp/Screens/drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreen();
  }
}

class _DashboardScreen extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    final resp = await Pages.home.fetch(force: true);
    if (resp == null) {
      Global.snackbar(context, "Tidak dapat memperbarui data");
    } else {
      News.parse(resp.body);
      setState(() {});
    }
    _refreshController.refreshCompleted();
  }

  bool showBar = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (showBar && _scrollController.offset == 0) {
        setState(() {
          showBar = false;
        });
      } else if (!showBar && _scrollController.offset != 0) {
        setState(() {
          showBar = true;
        });
      }
    });
    Pages.home.fetch().then((resp) {
      if (resp == null) {
        Global.snackbar(context, "Tidak dapat mengambil data");
      } else {
        News.parse(resp.body);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Beranda',
      style: optionStyle,
    ),
    Text(
      'Market',
      style: optionStyle,
    ),
    Text(
      'Akun',
      style: optionStyle,
    ),
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
        backgroundColor: Colors.yellow[100],
      ),
      body: Center(
        child: SmartRefresher(
            scrollController: _scrollController,
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: (Pages.home.isLoading)
                ? const Center(
                child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator()))
                : SingleChildScrollView(
              child: Column(
                children: [Column(children: News.list(context))],
              ),
            )
        ),
      ),
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
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
