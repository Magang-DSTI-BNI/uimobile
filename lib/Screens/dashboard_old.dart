import 'package:flutter/material.dart';
import 'package:mobileapp/Models/news.dart';
import 'package:mobileapp/Models/pages.dart';
import 'package:mobileapp/Screens/drawer.dart';
import 'package:mobileapp/Variables/global.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
    return Stack(children: [
      Image.asset(
        'assets\\images\\bg\\login_bg.jpg',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          drawer: AppDrawer(),
          appBar: AppBar(
            shadowColor: (showBar) ? null : Colors.transparent,
            backgroundColor: (showBar) ? null : Colors.transparent,
            title: const Text("Dasbor"),
          ),
          body: SmartRefresher(
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
                    )))
    ]);
  }
}
