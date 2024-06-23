class AddNoteState {}

class AddNoteInitialState extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState {}

class AddNoteSuccessState extends AddNoteState {}

class AddNoteFailureState extends AddNoteState {
  String errMessage;

  AddNoteFailureState({required this.errMessage});
}
