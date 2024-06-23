import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel note;

  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(
              note: note,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
        decoration: BoxDecoration(
          // color: note.color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(note.title),
              ),
              titleTextStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              subtitle: Text(
                note.subtitle,
                style: const TextStyle(fontSize: 18.0),
              ),
              trailing: IconButton(
                iconSize: 32,
                onPressed: () {
                  //  NotesData.removeNote(note);
                },
                icon: const Icon(
                  Icons.delete,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 18.0, top: 8.0, bottom: 2.0),
              child: Text(
                note.date,
                style: const TextStyle(fontSize: 15.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
