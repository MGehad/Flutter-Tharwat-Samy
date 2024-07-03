import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_model.dart';
import '../../services/update_product_service.dart';
import 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateProductInitialState());

  void updateProduct(
      {required String? name,
      required ProductModel model,
      required String? price,
      required String? description,
      required String? image}) async {
    emit(UpdateProductLoadingState());
    try {
      await UpdateProductService().updateProduct(
        title: name ?? model.title,
        price: price ?? model.price.toString(),
        description: description ?? model.description,
        image: image ?? model.image,
        category: model.category,
        id: model.id,
      );
      emit(UpdateProductSuccessState());
    } on Exception catch (e) {
      emit(UpdateProductFailureState(errMessage: e.toString()));
    }
  }
}
