import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/word_tile.dart';
import '../models/itemModel.dart';

class FamilyMembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ItemModel> words = [
      ItemModel(
          imagePath: "assets/images/family_members/family_father.png",
          title: "Chichioya",
          subtitle: "Father",
          audioPath: "sounds/family_members/father.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_mother.png",
          title: "Hahaoya",
          subtitle: "Mother",
          audioPath: "sounds/family_members/mother.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_grandfather.png",
          title: "Sofu",
          subtitle: "Grand Father",
          audioPath: "sounds/family_members/grand father.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_grandmother.png",
          title: "Sobo",
          subtitle: "Grand Mother",
          audioPath: "sounds/family_members/grand mother.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_daughter.png",
          title: "Musume",
          subtitle: "Daughter",
          audioPath: "sounds/family_members/daughter.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_older_brother.png",
          title: "Ani",
          subtitle: "Older Bother",
          audioPath: "sounds/family_members/older bother.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_older_sister.png",
          title: "Ane",
          subtitle: "Older Sister",
          audioPath: "sounds/family_members/older sister.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_son.png",
          title: "Musuko",
          subtitle: "Son",
          audioPath: "sounds/family_members/son.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_younger_brother.png",
          title: "Otōto",
          subtitle: "YoungerBrohter",
          audioPath: "sounds/family_members/younger brohter.wav"),
      ItemModel(
          imagePath: "assets/images/family_members/family_younger_sister.png",
          title: "Imōto",
          subtitle: "younger sister",
          audioPath: "sounds/family_members/younger sister.wav"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Members"),
        backgroundColor: Color(0xff46322B),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          return WordTile(
            model: words[index],
            color: Color(0xff558B37),
          );
        },
      ),
    );
  }
}
