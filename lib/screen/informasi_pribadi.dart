import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: 
            Image.asset(
              "assets/icons/logo_extended.png",
              height: 51,
              width: 168,
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
          ),)
      
    );
  }
}