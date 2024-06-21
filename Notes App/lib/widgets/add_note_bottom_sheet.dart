import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_text_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AppTextField(
                    label: "Title",
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    label: "Content",
                    maxLines: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const AddTextButton()
            ],
          ),
        );
      },
    );
  }
}

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
