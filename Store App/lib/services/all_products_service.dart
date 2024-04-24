import 'package:store_app/helper/api.dart';
import '../models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    String url = "https://fakestoreapi.com/products";
    List<ProductModel> products = [];

    List data = await Api().get(url: url);

    for (var json in data) {
      products.add(ProductModel.fromJson(json));
    }

    return products;
  }
}
