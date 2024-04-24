import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../views/product_view.dart';

class ItemCard extends StatefulWidget {
  final ProductModel model;

  const ItemCard({super.key, required this.model});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductView.id, arguments: widget.model);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 15,
                    spreadRadius: 0),
              ],
            ),
            child: Card(
              elevation: 4,
              shadowColor: Colors.grey.shade100,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.model.title.substring(0, 10),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.model.price.toString()),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.model.isFav = !widget.model.isFav;
                            });
                          },
                          child: (widget.model.isFav)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 22,
            top: -50,
            child: Image.network(
              widget.model.image,
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
