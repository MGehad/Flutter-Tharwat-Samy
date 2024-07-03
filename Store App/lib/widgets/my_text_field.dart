import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Icon icon;
  final String text;
  final String oldText;
  final Function(String) onSubmitted;
  final TextInputType textInputType;

  const MyTextField(
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
