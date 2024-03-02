import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/word_tile.dart';
import '../models/itemModel.dart';

class NumbersPages extends StatelessWidget {
  List<ItemModel> numbers = [
    ItemModel(
        imagePath: "assets/images/numbers/number_one.png",
        title: "ichi",
        subtitle: "one",
        audioPath: "sounds/numbers/number_one_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_two.png",
        title: "Ni",
        subtitle: "two",
        audioPath: "sounds/numbers/number_two_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_three.png",
        title: "San",
        subtitle: "three",
        audioPath: "sounds/numbers/number_three_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_four.png",
        title: "Shi",
        subtitle: "four",
        audioPath: "sounds/numbers/number_four_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_five.png",
        title: "Go",
        subtitle: "five",
        audioPath: "sounds/numbers/number_five_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_six.png",
        title: "Roku",
        subtitle: "six",
        audioPath: "sounds/numbers/number_six_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_seven.png",
        title: "Sebun",
        subtitle: "seven",
        audioPath: "sounds/numbers/number_seven_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_eight.png",
        title: "hachi",
        subtitle: "eight",
        audioPath: "sounds/numbers/number_eight_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_nine.png",
        title: "Kyū",
        subtitle: "nine",
        audioPath: "sounds/numbers/number_nine_sound.mp3"),
    ItemModel(
        imagePath: "assets/images/numbers/number_ten.png",
        title: "Jū",
        subtitle: "ten",
        audioPath: "sounds/numbers/number_ten_sound.mp3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers"),
        backgroundColor: Color(0xff46322B),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return WordTile(
            model: numbers[index],
            color: Color(0xffEF9235),
          );
        },
      ),
    );
  }
}
