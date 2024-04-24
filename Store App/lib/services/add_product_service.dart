import 'package:store_app/helper/api.dart';

class AddProductService {
  Future<void> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    String url = 'https://fakestoreapi.com/products';

    await Api().post(url: url, body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
  }
}
