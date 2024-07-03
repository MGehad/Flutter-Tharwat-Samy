import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_all_products_cubit/get_all_products_cubit.dart';
import '../cubit/get_all_products_cubit/get_all_products_state.dart';
import '../models/product_model.dart';
import 'item_card.dart';

class AllProductsGridView extends StatelessWidget {
  const AllProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsSuccessState) {
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
        } else if (state is GetAllProductsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Failed to load products'),
            ),
          );
        }
      },
    );
  }
}
