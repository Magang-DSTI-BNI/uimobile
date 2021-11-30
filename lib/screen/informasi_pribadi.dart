import 'package:flutter/material.dart';
import 'package:uimobile_web/Models/category_bar.dart';


class InformasiPribadiScreen extends StatefulWidget {
  const InformasiPribadiScreen({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InformasiPribadiScreen();
  }
}

class _InformasiPribadiScreen extends State<InformasiPribadiScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/icons/logo_extended.png",
                height: 38,
                width: 168,
              ),
            ),
          actions: <Widget> [
            Padding(
              padding: EdgeInsets.only(right: 30.0, top: 2.0),
              child:
                IconButton(onPressed: (){

                }, 
                icon: Icon(
                  Icons.notifications_outlined, 
                  color: Colors.black87,
                  )),
              ),
              Padding(
              padding: EdgeInsets.only(right: 30.0),
              child:
                IconButton(onPressed: (){

                }, 
                iconSize: 42,
                icon: Icon(
                  Icons.account_circle, 
                  color: Colors.black87,
                  )),
              ),
            ]
          ),),
          body: 

ListView.builder(
  padding: const EdgeInsets.all(8),
  scrollDirection: Axis.horizontal,
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 700,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  }
)
      
    );
  }
}