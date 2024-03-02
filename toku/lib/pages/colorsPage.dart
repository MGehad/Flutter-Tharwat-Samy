import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/word_tile.dart';
import '../models/itemModel.dart';

class ColorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ItemModel> colors = [
      ItemModel(
          imagePath: "assets/images/colors/color_black.png",
          title: "Kuro",
          subtitle: "Black",
          audioPath: "sounds/colors/black.wav"),
      ItemModel(
          imagePath: "assets/images/colors/color_brown.png",
          title: "Chairo",
          subtitle: "Brown",
          audioPath: "sounds/colors/brown.wav"),
      ItemModel(
          imagePath: "assets/images/colors/color_dusty_yellow.png",
          title: "Dasutiierō",
          subtitle: "Dusty Yellow",
          audioPath: "sounds/colors/dusty yellow.wav"),
      ItemModel(
          imagePath: "assets/images/colors/color_gray.png",
          title: "Gurē",
          subtitle: "Gray",
          audioPath: "sounds/colors/gray.wav"),
      ItemModel(
          imagePath: "assets/images/colors/color_green.png",
          title: "Midori",
          subtitle: "Green",
          audioPath: "sounds/colors/green.wav"),
      ItemModel(
          imagePath: "assets/images/colors/color_red.png",
          title: "Aka",
          subtitle: "Red",
          audioPath: "sounds/colors/red.wav"),
      ItemModel(
          imagePath: "assets/images/colors/color_white.png",
          title: "Shiro",
          subtitle: "White",
          audioPath: "sounds/colors/white.wav"),
      ItemModel(
          imagePath: "assets/images/colors/yellow.png",
          title: "Kiiro",
          subtitle: "Yellow",
          audioPath: "sounds/colors/yellow.wav"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Colors"),
        backgroundColor: Color(0xff46322B),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return WordTile(
            model: colors[index],
            color: Color(0xff558B37),
          );
        },
      ),
    );
  }
}
