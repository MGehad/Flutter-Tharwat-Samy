import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class AddTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        shape: MaterialStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 150.0, vertical: 10.0),
        ),
        backgroundColor: MaterialStatePropertyAll(primaryColor),
      ),
      child: const Text(
        "Add",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}
