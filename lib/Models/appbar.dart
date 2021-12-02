import 'package:flutter/material.dart';

class AppbarObject extends StatefulWidget {
  const AppbarObject({ Key? key }) : super(key: key);

  @override
  AppbarObjectState createState() => AppbarObjectState();
}

class AppbarObjectState extends State<AppbarObject> {
  @override
  Widget build(BuildContext context) {
    return 
      PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
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
              padding: const EdgeInsets.only(right: 30.0, top: 2.0),
              child:
                IconButton(onPressed: (){

                }, 
                icon: const Icon(
                  Icons.notifications_outlined, 
                  color: Colors.black87,
                  )),
              ),
              Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child:
                IconButton(onPressed: (){

                }, 
                iconSize: 42,
                icon: const Icon(
                  Icons.account_circle, 
                  color: Colors.black87,
                  )),
              ),
            ]
          ),);
  }
}