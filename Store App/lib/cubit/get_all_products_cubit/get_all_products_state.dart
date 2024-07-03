import '../../models/product_model.dart';

class GetAllProductsState {}

class GetAllProductsInitialState extends GetAllProductsState {}

class GetAllProductsSuccessState extends GetAllProductsState {
  List<ProductModel> allProducts;

  GetAllProductsSuccessState({required this.allProducts});
}

class GetAllProductsLoadingState extends GetAllProductsState {}

class GetAllProductsFailureState extends GetAllProductsState {
  final String errMessage;

  GetAllProductsFailureState({required this.errMessage});
}
