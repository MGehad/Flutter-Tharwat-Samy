import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'update_view.dart';

class ProductView extends StatelessWidget {
  static String id = 'product view';

  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel model =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.category,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, UpdateView.id, arguments: model);
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: Image.network(
                model.image,
                height: 320,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Text(
                            model.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            "  ${model.description}",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                model.rate!.rate.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade600,
                              ),
                            ],
                          ),
                          Text(
                            "\$${model.price.toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
