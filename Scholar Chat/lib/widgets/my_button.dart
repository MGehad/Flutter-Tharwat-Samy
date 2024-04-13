import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  VoidCallback? onTap;

   MyButton({Key? key, required this.buttonText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.maxFinite,
        height: 45,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 22,
              color: Color(0xff2B475E),
            ),
          ),
        ),
      ),
    );
  }
}
