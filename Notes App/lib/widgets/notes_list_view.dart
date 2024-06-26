import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_note_cubit/get_note_cubit.dart';
import '../cubits/get_note_cubit/get_note_state.dart';
import '../models/note_model.dart';
import 'note_widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<GetNoteCubit>(context).notes;
        return ListView.builder(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteWidget(
              note: notes[index],
            );
          },
        );
      },
    );
  }
}
