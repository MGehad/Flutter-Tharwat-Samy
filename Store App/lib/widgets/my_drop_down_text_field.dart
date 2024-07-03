import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class MyDropDownTextField extends StatelessWidget {
  const MyDropDownTextField(
      {super.key,
      required this.categories,
      required this.text,
      this.onChanged});

  final List<String> categories;
  final String text;
  final Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      textFieldDecoration: InputDecoration(
        prefixIcon: const Icon(Icons.edit),
        label: Text(text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: SingleValueDropDownController(),
      clearOption: false,
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      dropDownItemCount: categories.length,
      dropDownList: buildDropDownValueModelList(categories),
    );
  }

  List<DropDownValueModel> buildDropDownValueModelList(
      List<String> categories) {
    List<DropDownValueModel> list = [];
    for (var category in categories) {
      list.add(
        DropDownValueModel(name: category, value: category),
      );
    }
    return list;
  }
}
