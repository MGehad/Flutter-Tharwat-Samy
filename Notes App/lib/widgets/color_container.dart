import 'package:flutter/material.dart';
import 'package:notes_app/models/color_model.dart';

class ColorContainer extends StatelessWidget {
  ColorModel colorModel;
  VoidCallback onTap;

  ColorContainer({super.key, required this.colorModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: colorModel.color,
          shape: BoxShape.circle,
        ),
        height: 50.0,
        width: 50.0,
        child: (colorModel.isSelected)
            ? const Icon(Icons.check_circle_outline_rounded)
            : null,
      ),
    );
  }
}
