class AddProductState {}

class AddProductInitialState extends AddProductState {}

class AddProductSuccessState extends AddProductState {}

class AddProductLoadingState extends AddProductState {}

class AddProductFailureState extends AddProductState {
  final String errMessage;

  AddProductFailureState({required this.errMessage});
}
