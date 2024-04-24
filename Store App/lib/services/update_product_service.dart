import '../helper/api.dart';

class UpdateProductService {
  Future<void> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    await Api().put(
      id: id,
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
  }
}
