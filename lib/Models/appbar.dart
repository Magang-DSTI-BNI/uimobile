import 'package:flutter/material.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppbar({ Key? key }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  @override
  MyAppbarState createState() => MyAppbarState();
}

class MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return 
      AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: 
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "assets/images/icons/logo_extended.png",
              height: 38,
              width: 168,
            ),
          ),
        actions: <Widget> [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (){

            },
              splashRadius: 18,
              hoverColor: Colors.transparent,
              
              iconSize: 24, 
              icon: const Icon(
                Icons.notifications_outlined, 
                color: Colors.black87,
              )),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              onPressed: (){

            },
            iconSize: 38,
            splashRadius: 18,
            hoverColor: Colors.transparent,
            icon: const Icon(
              Icons.account_circle, 
              color: Colors.black87,
              )),
          ),
          ]
        );
  }
}