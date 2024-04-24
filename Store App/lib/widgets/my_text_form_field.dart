import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String text;
  Function(String) onChanged;
  TextInputType textInputType;

  MyTextFormField(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.edit),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: text,
      ),
    );
  }
}
