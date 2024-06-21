import 'package:flutter/material.dart';

class AddTextButton extends StatelessWidget {
  const AddTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
          backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
      child: const Text(
        "Add",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
