import 'package:flutter/material.dart';
import '../constants.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController textEditingController;

  const AppTextFormField(
      {super.key,
      required this.label,
      required this.maxLines,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "This field is required";
        }
        return null;
      },
      maxLines: maxLines,
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(color: primaryColor),
        ),
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
