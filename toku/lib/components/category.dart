import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Color color;
  String string;
  Function() onTap;

  Category({required this.color, required this.string, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20.0),
        width: double.infinity,
        height: 70,
        color: color,
        child: Text(
          string,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
