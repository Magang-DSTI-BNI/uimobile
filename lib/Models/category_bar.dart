import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({ Key? key }) : super(key: key);

  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Colors.yellow[700],
                    
    );
  }
}