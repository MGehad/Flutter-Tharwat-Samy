import 'package:flutter/material.dart';
import 'package:toku/components/info_tile.dart';
import '../models/itemModel.dart';

class WordTile extends StatelessWidget {
  ItemModel model;
  Color color;

  WordTile({required this.model, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Row(
        children: [
          Container(
              color: const Color(0xffFFF6DC),
              child: Image.asset(model.imagePath!)),
          Expanded(child: InfoTile(color: color, model: model))
        ],
      ),
    );
  }
}
