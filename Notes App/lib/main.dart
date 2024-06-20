import 'package:flutter/material.dart';
import 'package:notes_app/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: (darkMode) ? Brightness.dark : Brightness.light,
        useMaterial3: true,
      ),
      home: HomeView(
        toggleDarkMode: () {
          setState(() {
            darkMode = !darkMode;
          });
        },
      ),
    );
  }
}
