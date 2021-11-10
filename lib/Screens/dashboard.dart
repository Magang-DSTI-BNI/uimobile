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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
