import 'package:flutter/material.dart';
import '../components/my_custom_scroll_view.dart';
import '../components/my_text_field.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "News",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Cloud",
            style: TextStyle(color: Colors.amber),
          )
        ]),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          MyTextField(),
          const Expanded(
            child: MyCustomScrollView(),
          ),
        ]),
      ),
    );
  }
}
