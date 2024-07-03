import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_model.dart';
import '../../services/get_category_service.dart';
import 'get_all_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitialState());

  void getProducts({required String category}) async {
    emit(GetProductsLoadingState());
    try {
      List<ProductModel> products =
          await GetCategoryService().getProducts(category);
      emit(GetProductsSuccessState(products: products));
    } catch (e) {
      emit(GetProductsFailureState(errMessage: e.toString()));
    }
  }
}
