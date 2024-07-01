import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String txt;

  const CustumButton({super.key, required this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.orange),
          minimumSize: MaterialStatePropertyAll(Size(125, 45))),
      onPressed: onPressed,
      child: Text(
        txt,
        style: const TextStyle(color: Colors.black, fontSize: 17),
      ),
    );
  }
}
