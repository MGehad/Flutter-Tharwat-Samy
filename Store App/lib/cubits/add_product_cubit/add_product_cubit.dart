import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/add_product_cubit/add_product_state.dart';

import '../../services/add_product_service.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitialState());

  void addProduct(
      {required String? name,
      required String? price,
      required String? description,
      required String? image,
      required String? category}) async {
    emit(AddProductLoadingState());

    try {
      await AddProductService().addProduct(
        title: name!,
        price: price!,
        description: description!,
        image: image!,
        category: category!,
      );
      emit(AddProductSuccessState());
    } catch (e) {
      emit(AddProductFailureState(errMessage: e.toString()));
    }
  }
}
