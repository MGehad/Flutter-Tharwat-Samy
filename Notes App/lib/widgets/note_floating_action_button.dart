import 'package:flutter/material.dart';
import '../constants.dart';
import 'add_note_bottom_sheet.dart';

class NoteFloatingActionButton extends StatelessWidget {
  const NoteFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: primaryColor,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
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
