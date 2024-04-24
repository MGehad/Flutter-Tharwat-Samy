import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List> getAllCategories() async {
    String url = 'https://fakestoreapi.com/products/categories';

    List data = await Api().get(url: url);

    return data;
  }
}
