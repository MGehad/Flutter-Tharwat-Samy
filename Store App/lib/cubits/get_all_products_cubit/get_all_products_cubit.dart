import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_model.dart';
import '../../services/all_products_service.dart';
import 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitialState());

  void getAllProducts() async {
    emit(GetAllProductsLoadingState());
    try {
      List<ProductModel> allProducts =
          await AllProductsService().getAllProducts();
      emit(GetAllProductsSuccessState(allProducts: allProducts));
    } catch (e) {
      emit(GetAllProductsFailureState(errMessage: e.toString()));
    }
  }
}
