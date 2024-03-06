import 'package:flutter/material.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyTunesPlayerApp());
}

class MyTunesPlayerApp extends StatelessWidget {
  const MyTunesPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
