import 'package:flutter/material.dart';
import '../constants.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController textEditingController;

  const AppTextField(
      {super.key,
      required this.label,
      required this.maxLines,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(label,style: TextStyle(color: primaryColor),),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
    );
  }
}
