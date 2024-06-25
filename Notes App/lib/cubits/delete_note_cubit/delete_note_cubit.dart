import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../models/note_model.dart';
import 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitialState());

  deleteNote(NoteModel note) {
    emit(DeleteNoteLoadingState());
    try {
      var noteBox = Hive.box<NoteModel>(notesBox);
      noteBox.delete(note);
      emit(DeleteNoteSuccessState());
    } catch (e) {
      emit(DeleteNoteFailureState(errMessage: e.toString()));
    }
  }
}
