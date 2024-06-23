import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(super.initialState);

  addNote(NoteModel note) async {
    try {
      emit(AddNoteInitialState());
      var noteBox = Hive.box<NoteModel>(notesBox);
      noteBox.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailureState(errMessage: e.toString()));
    }
  }
}
