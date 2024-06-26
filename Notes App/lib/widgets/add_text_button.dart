import 'package:flutter/material.dart';

import '../constants.dart';

class AddTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const AddTextButton(
      {super.key, required this.onPressed, this.isLoading = false});

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
        minimumSize: MaterialStatePropertyAll(Size(double.maxFinite, 50)),
        backgroundColor: MaterialStatePropertyAll(primaryColor),
      ),
      child: (isLoading)
          ? const SizedBox(
              width: 24.0, height: 24.0, child: CircularProgressIndicator())
          : const Text(
              "Add",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
    );
  }
}
