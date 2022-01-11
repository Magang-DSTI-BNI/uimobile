import 'package:flutter/material.dart';

class UIPay extends StatefulWidget {
  const UIPay({Key? key}) : super(key: key);

  @override
  _UIPayState createState() => _UIPayState();
}

class _UIPayState extends State<UIPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'UI Pay',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,15,20,0),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}

