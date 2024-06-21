import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';

class NoteFloatingActionButton extends StatelessWidget {
  const NoteFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => AddNoteBottomSheet(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
