import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../models/note_model.dart';
import 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitialState());

  List<NoteModel> notes = [];

  getAllNotes() {
    var noteBox = Hive.box<NoteModel>(notesBox);
    notes = noteBox.values.toList();
    notes = notes.reversed.toList();
    emit(GetNoteSuccessState());
  }
}
