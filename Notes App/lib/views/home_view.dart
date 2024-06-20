import 'package:flutter/material.dart';

import '../widgets/note_widget.dart';

class HomeView extends StatelessWidget {
  final VoidCallback toggleDarkMode;

  HomeView({required this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return NoteWidget();
        },
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      shape: CircleBorder(),
      onPressed: () {},
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 28,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                onPressed: toggleDarkMode,
                icon: const Icon(
                  Icons.sunny,
                  size: 28,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          )
        ],
      );
}
