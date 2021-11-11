import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobileapp/Screens/login.dart';
import 'dart:ui' show ImageFilter;
import 'package:mobileapp/Screens/settings.dart';
import 'package:mobileapp/Variables/global.dart';

class AppDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Material(
        color:  Theme.of(context).primaryColor,
        textStyle: TextStyle(
          color:  Theme.of(context).textTheme.bodyText1!.color,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'UI Mobile-Staff',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  const SizedBox(height: 12),
                  CircleAvatar(
                    radius: 40,
                  ),
                  const SizedBox(height: 12,),
                  Text(
                    'nama',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Notifikasi',
                    icon: Icons.notifications_outlined,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Pengaturan',
                    icon: Icons.settings,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Keluar',
                    icon: Icons.logout,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    onClicked: () => selectedItem(context, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required Color? color,
    VoidCallback? onClicked,
  }) {
    final iconcolor=color;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon,color:iconcolor),
      title: Text(text),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>SettingsScreen(),
        ));
        break;
      case 3:
        Global.credential.logout().then((value) {
          if(value){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
          }else{
            Global.snackbar(context, 'tidak dapat keluar');
          }
        });
        break;
    }
  }
}
