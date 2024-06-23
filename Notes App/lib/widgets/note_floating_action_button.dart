import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import '../constants.dart';

class NoteFloatingActionButton extends StatelessWidget {
  const NoteFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: primaryColor,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const AddNoteBottomSheet(),
        );
      },
      child: const Icon(
        Icons.add,
        size: 32,
      ),
    );
  }
}
