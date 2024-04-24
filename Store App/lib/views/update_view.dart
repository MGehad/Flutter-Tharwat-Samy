import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../models/product_model.dart';
import '../services/update_product_service.dart';
import '../widgets/my_text_field.dart';

class UpdateView extends StatefulWidget {
  static String id = 'update view';

  const UpdateView({super.key});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  @override
  Widget build(BuildContext context) {
    ProductModel model =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    String? name;
    String? description;
    String? price;
    String? image;
    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Update Product",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          children: [
            Image.network(
              model.image,
              height: 120,
            ),
            const SizedBox(height: 80),
            MyTextField(
              icon: const Icon(Icons.edit),
              text: 'Product Name',
              oldText: model.title,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  name = value;
                } else {
                  name = model.title;
                }
              },
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 25),
            MyTextField(
              icon: const Icon(Icons.edit),
              text: 'Description',
              oldText: model.description,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  description = value;
                } else {
                  description = model.description;
                }
              },
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 25),
            MyTextField(
              icon: const Icon(Icons.edit),
              text: 'Price',
              oldText: model.price.toString(),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  price = value;
                } else {
                  price = model.price.toString();
                }
              },
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 25),
            MyTextField(
              icon: const Icon(Icons.edit),
              text: 'Image Path',
              oldText: model.image,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  image = value;
                } else {
                  image = model.image;
                }
              },
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await updateProd(name, model, price, description, image);
                  } catch (e) {
                    throw Exception(e.toString());
                  }
                  setState(
                    () {
                      isLoading = false;
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'The product has been modified successfully'),
                        ),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.grey),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  ),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future updateProd(String? name, ProductModel model, String? price,
      String? description, String? image) async {
    await UpdateProductService().updateProduct(
      title: name ?? model.title,
      price: price ?? model.price.toString(),
      description: description ?? model.description,
      image: image ?? model.image,
      category: model.category,
      id: model.id,
    );
  }
}
