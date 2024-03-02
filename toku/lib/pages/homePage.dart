import 'package:flutter/material.dart';
import 'package:toku/pages/colorsPage.dart';
import 'package:toku/pages/family_membersPage.dart';
import 'package:toku/pages/numbersPage.dart';
import 'package:toku/pages/phrasesPage.dart';

import '../components/Category.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF6D8),
      appBar: AppBar(
        backgroundColor: Color(0xff46322B),
        title: Text("Toku", style: TextStyle(fontSize: 22)),
      ),
      body: Column(
        children: [
          Category(
              color: Color(0xffEF9235),
              string: "Numbers",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NumbersPages();
                    },
                  ),
                );
              }),
          Category(
              color: Color(0xff558B37),
              string: "Family Members",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FamilyMembersPage();
                    },
                  ),
                );
              }),
          Category(
              color: Color(0xff79359F),
              string: "Colors",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ColorsPage();
                    },
                  ),
                );
              }),
          Category(
              color: Color(0xff50ADC7),
              string: "Phrases",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PhrasesPages();
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
