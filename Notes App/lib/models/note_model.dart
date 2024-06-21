import 'package:flutter/material.dart';

class NoteModel {
  String title;
  String subtitle;
  String date;
  Color color;

  NoteModel(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.color});
}
