class GetAllCategoriesState {}

class GetAllCategoriesInitialState extends GetAllCategoriesState {}

class GetAllCategoriesSuccessState extends GetAllCategoriesState {
  List<String> data;

  GetAllCategoriesSuccessState({required this.data});
}

class GetAllCategoriesLoadingState extends GetAllCategoriesState {}

class GetAllCategoriesFailureState extends GetAllCategoriesState {
  final String errMessage;

  GetAllCategoriesFailureState({required this.errMessage});
}
