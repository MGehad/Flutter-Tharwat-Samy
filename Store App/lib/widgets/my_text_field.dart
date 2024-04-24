import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  Icon icon;
  String text;
  String oldText;
  Function(String) onSubmitted;
  TextInputType textInputType;

  MyTextField(
      {super.key,
      required this.icon,
      required this.text,
      required this.oldText,
      required this.onSubmitted,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      keyboardType: textInputType,
      decoration: InputDecoration(
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: text,
          hintText: oldText),
    );
  }
}
