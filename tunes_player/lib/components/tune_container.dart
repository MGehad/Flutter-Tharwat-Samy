import 'package:flutter/material.dart';
import '../models/tune_model.dart';

class TuneContainer extends StatelessWidget {
  final TuneModel model;

  const TuneContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          model.playSound();
        },
        child: Container(
          color: model.color,
        ),
      ),
    );
  }
}
