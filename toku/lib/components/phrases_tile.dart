import 'package:flutter/material.dart';
import 'package:toku/components/info_tile.dart';
import '../models/itemModel.dart';

class PhrasesTile extends StatelessWidget {
  Color color;
  ItemModel model;

  PhrasesTile({required this.model, required this.color});

  @override
  Widget build(BuildContext context) {
    return InfoTile(color: color, model: model);
  }
}
