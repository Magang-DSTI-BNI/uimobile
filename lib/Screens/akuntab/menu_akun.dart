import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.all(15),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          backgroundColor: Colors.white,
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

