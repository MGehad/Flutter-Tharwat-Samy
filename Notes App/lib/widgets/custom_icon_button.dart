import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 28,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}
