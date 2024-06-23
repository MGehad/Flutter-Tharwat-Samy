class DeleteNoteState {}

class DeleteNoteInitialState extends DeleteNoteState {}

class DeleteNoteLoadingState extends DeleteNoteState {}

class DeleteNoteSuccessState extends DeleteNoteState {}

class DeleteNoteFailureState extends DeleteNoteState {
  String errMessage;

  DeleteNoteFailureState({required this.errMessage});
}
