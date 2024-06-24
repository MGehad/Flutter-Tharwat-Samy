import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/add_note_cubit/add_note_state.dart';
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 20.0,
                        left: 20.0,
                        top: 35.0,
                        bottom:
                            MediaQuery.of(context).viewInsets.bottom + 25.0),
                    child: const NoteForm(),
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
