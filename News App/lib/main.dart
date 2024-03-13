import 'package:flutter/material.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyNewsApp());
}

class MyNewsApp extends StatelessWidget {
  const MyNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeView(),
    );
  }
}
