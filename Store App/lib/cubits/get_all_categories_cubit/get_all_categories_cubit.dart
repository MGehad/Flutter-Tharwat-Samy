import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/all_categories_service.dart';
import 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit() : super(GetAllCategoriesInitialState());

  void getAllCategories() async {
    emit(GetAllCategoriesLoadingState());
    try {
      var data = await AllCategoriesService()
          .getAllCategories()
          .then((value) => List<String>.from(value));
      emit(GetAllCategoriesSuccessState(data: data));
    } catch (e) {
      emit(GetAllCategoriesFailureState(errMessage: e.toString()));
    }
  }
}
