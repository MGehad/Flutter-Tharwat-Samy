import '../../models/product_model.dart';

class GetProductsState {}

class GetProductsInitialState extends GetProductsState {}

class GetProductsSuccessState extends GetProductsState {
  List<ProductModel> products;

  GetProductsSuccessState({required this.products});
}

class GetProductsLoadingState extends GetProductsState {}

class GetProductsFailureState extends GetProductsState {
  final String errMessage;

  GetProductsFailureState({required this.errMessage});
}
