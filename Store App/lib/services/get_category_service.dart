import 'package:store_app/helper/api.dart';
import '../models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getProducts(String category) async {
    String url = 'https://fakestoreapi.com/products/category/$category';
    List<ProductModel> products = [];

    List data = await Api().get(url: url);

    for (var json in data) {
      products.add(ProductModel.fromJson(json));
    }

    return products;
  }
}
