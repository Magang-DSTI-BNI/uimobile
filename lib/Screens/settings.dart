import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Pengaturan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
      ),

    );
  }
}
