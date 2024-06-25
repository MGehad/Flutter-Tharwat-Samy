import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';
import '../../constants.dart';
import 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitialState());

  getAllNotes() {
    try {
      var noteBox = Hive.box<NoteModel>(notesBox);
      List<NoteModel> notes = [];
      notes = noteBox.values.toList();
      emit(GetNoteSuccessState(notes));
    } catch (e) {
      emit(GetNoteFailureState(e.toString()));
    }
  }
}
