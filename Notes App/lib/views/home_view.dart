import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../widgets/note_floating_action_button.dart';
import '../widgets/note_widget.dart';

class HomeView extends StatelessWidget {
  final VoidCallback toggleDarkMode;

  const HomeView({super.key, required this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = [
      NoteModel(
          title: "Title",
          subtitle:
              "subtitlesubti tlesubt itlesub titlesub subtitlesu btitle title subtitle",
          date: "21-5-2022",
          color: Colors.teal),
      NoteModel(
          title: "title",
          subtitle: "subtitle",
          date: "21-5-2024",
          color: Colors.deepOrange),
      NoteModel(
          title: "title",
          subtitle: "subtitle",
          date: "21-5-2024",
          color: Colors.black87),
      NoteModel(
          title: "title",
          subtitle: "subtitle",
          date: "21-5-2025",
          color: Colors.indigoAccent),
      NoteModel(
          title: "title",
          subtitle: "subtitle",
          date: "21-5-2027",
          color: Colors.purple),
      NoteModel(
          title: "title",
          subtitle: "subtitle",
          date: "21-5-2028",
          color: Colors.pink),
      NoteModel(
          title: "title",
          subtitle: "subtitle",
          date: "21-5-2020",
          color: Colors.orangeAccent),
    ];
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: const NoteFloatingActionButton(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListView.builder(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteWidget(
              note: notes[index],
            );
          },
        ),
      ),
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
