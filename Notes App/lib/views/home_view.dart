import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../widgets/note_widget.dart';

class HomeView extends StatelessWidget {
  final VoidCallback toggleDarkMode;

  HomeView({required this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = [
      NoteModel(
          title: "Title",
          subtitle:
              "subtitlesubti tlesubt itlesub titlesub subtitlesu btitle title subtitle",
          date: "21-5-2022"),
      NoteModel(title: "title", subtitle: "subtitle", date: "date"),
      NoteModel(title: "title", subtitle: "subtitle", date: "date"),
      NoteModel(title: "title", subtitle: "subtitle", date: "date"),
      NoteModel(title: "title", subtitle: "subtitle", date: "date"),
      NoteModel(title: "title", subtitle: "subtitle", date: "date"),
      NoteModel(title: "title", subtitle: "subtitle", date: "date"),
    ];
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteWidget(
            note: notes[index],
          );
        },
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {},
      child: const Icon(Icons.add),
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
