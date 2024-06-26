import 'package:flutter/material.dart';

import '../constants.dart';

class ColorModel {
  Color color;
  bool isSelected;

  ColorModel({required this.color, required this.isSelected});

  static List<ColorModel> makeColorSelected(int color) {
    for (var element in colorCircles) {
      element.isSelected = false;
      if (element.color.value == color) {
        element.isSelected = true;
      }
    }
    return colorCircles;
  }

  static List<ColorModel> clearSelected() {
    for (var element in colorCircles) {
      element.isSelected = false;
    }
    return colorCircles;
  }

  static Color? getSelectedColor() {
    for (var element in colorCircles) {
      if (element.isSelected) {
        return element.color;
      }
    }
    return null;
  }
}
