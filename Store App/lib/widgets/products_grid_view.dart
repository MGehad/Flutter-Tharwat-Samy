import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_products_cubit/get_all_products_cubit.dart';
import '../cubit/get_products_cubit/get_all_products_state.dart';
import '../models/product_model.dart';
import 'item_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetProductsCubit>(context).getProducts(category: category);

    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccessState) {
          List<ProductModel> products = state.products;
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 100.0),
            child: GridView.builder(
              itemCount: products.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 70),
              itemBuilder: (context, index) => ItemCard(
                model: products[index],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
