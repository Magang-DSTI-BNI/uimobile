import 'package:flutter/material.dart';
import 'package:mobileapp/Variables/global.dart';
import 'dart:ui' show ImageFilter;

class AppDrawer {
  static get widget => Stack(children: [
        Drawer(
            child: Column(
          children: [
            Container(
              color: Global.colors.yellow,
              height: 200,
            )
          ],
        ))
      ]);
}
