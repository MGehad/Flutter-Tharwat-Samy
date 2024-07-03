class UpdateProductState {}

class UpdateProductInitialState extends UpdateProductState {}

class UpdateProductSuccessState extends UpdateProductState {}

class UpdateProductLoadingState extends UpdateProductState {}

class UpdateProductFailureState extends UpdateProductState {
  final String errMessage;

  UpdateProductFailureState({required this.errMessage});
}
