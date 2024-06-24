import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'note_form.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccessState) {
                Navigator.pop(context);
              } else if (state is AddNoteFailureState) {}
            },
            builder: (BuildContext context, Object? state) {
              return AbsorbPointer(
                absorbing: state is AddNoteLoadingState,
                child: const SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
                    child: NoteForm(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
