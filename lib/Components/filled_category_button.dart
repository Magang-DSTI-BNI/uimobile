import 'package:flutter/material.dart';

class FillCategoryButton extends StatefulWidget {
  final String text;
  const FillCategoryButton({ 
    Key? key,
    required this.text,
    }) : super(key: key);
  
  @override
  _FillCategoryButtonState createState() => _FillCategoryButtonState();
}

class _FillCategoryButtonState extends State<FillCategoryButton> {
  bool pressAttention = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(Icons.circle),
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: pressAttention ? Colors.black : Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(210, 65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.transparent),
        ),
        primary: pressAttention ? Colors.yellow[100] : Colors.yellowAccent[400],
      ),
      
      onPressed: () => setState(() {
        pressAttention = !pressAttention;
      }),
    );
  }
}