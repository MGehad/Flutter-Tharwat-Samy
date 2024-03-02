import 'package:flutter/material.dart';
import '../models/itemModel.dart';

class InfoTile extends StatelessWidget {
  Color color;
  ItemModel model;

  InfoTile({required this.model, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title,
                    style: const TextStyle(color: Colors.white, fontSize: 17)),
                Text(model.subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
                icon:
                    const Icon(Icons.play_arrow, size: 28, color: Colors.white),
                onPressed: () {
                  model.playSound();
                }),
          ),
        ],
      ),
    );
  }
}
