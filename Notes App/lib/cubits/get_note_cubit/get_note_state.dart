import '../../models/note_model.dart';

class GetNoteState {}

class GetNoteInitialState extends GetNoteState {}

class GetNoteSuccessState extends GetNoteState {
  final List<NoteModel> notes;

  GetNoteSuccessState(this.notes);
}

class GetNoteFailureState extends GetNoteState {
  final String errMessage;

  GetNoteFailureState(this.errMessage);
}
