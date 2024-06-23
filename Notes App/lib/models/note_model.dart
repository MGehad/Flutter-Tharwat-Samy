import 'package:flutter/material.dart';

class NoteModel {
  final String title;
  final String subtitle;
  final String date;
  final Color color;

  NoteModel(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.color});
}
