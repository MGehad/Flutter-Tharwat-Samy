import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  String label;
  int maxLines;

  AppTextField({super.key, required this.label, required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}