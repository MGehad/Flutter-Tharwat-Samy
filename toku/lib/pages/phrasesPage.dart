import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toku/components/phrases_tile.dart';
import '../models/itemModel.dart';

class PhrasesPages extends StatelessWidget {
  List<ItemModel> phrases = [
    ItemModel(
        subtitle: "Are you coming?",
        title: "Kimasu ka?",
        audioPath: "sounds/phrases/are_you_coming.wav"),
    ItemModel(
        subtitle: "Dont forget to subscribe.",
        title: "Wasurezu ni kōdoku shite kudasai.",
        audioPath: "sounds/phrases/dont_forget_to_subscribe.wav"),
    ItemModel(
        subtitle: "How are you feeling?",
        title: "Go kibun wa ikagadesu ka?",
        audioPath: "sounds/phrases/how_are_you_feeling.wav"),
    ItemModel(
        subtitle: "I love anime.",
        title: "Watashi wa anime ga daisukidesu.",
        audioPath: "sounds/phrases/i_love_anime.wav"),
    ItemModel(
        subtitle: "I love programming.",
        title: "Watashi wa puroguramingu ga daisukidesu.",
        audioPath: "sounds/phrases/i_love_programming.wav"),
    ItemModel(
        subtitle: "Programming is easy.",
        title: "Puroguramingu wa kantandesu.",
        audioPath: "sounds/phrases/programming_is_easy.wav"),
    ItemModel(
        subtitle: "What is your name?",
        title: "Anata no namae wa nanidesu ka?",
        audioPath: "sounds/phrases/what_is_your_name.wav"),
    ItemModel(
        subtitle: "Where are you going?",
        title: "Doko ni iku no?",
        audioPath: "sounds/phrases/where_are_you_going.wav"),
    ItemModel(
        subtitle: "Yes i am coming.",
        title: "Hai, kimasu",
        audioPath: "sounds/phrases/yes_im_coming.wav"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phrases"),
        backgroundColor: Color(0xff46322B),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return PhrasesTile(
            model: phrases[index],
            color: Color(0xff50ADC7),
          );
        },
      ),
    );
  }
}
