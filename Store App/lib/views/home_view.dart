import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:store_app/cubit/get_all_products_cubit/get_all_products_state.dart';
import '../cubit/get_all_categories_cubit/get_all_categories_cubit.dart';
import '../cubit/get_all_categories_cubit/get_all_categories_state.dart';
import '../models/product_model.dart';
import '../services/get_category_service.dart';
import '../widgets/item_card.dart';
import 'add_view.dart';

class HomeView extends StatefulWidget {
  static String id = 'home view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllCategoriesCubit>(context).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
      builder: (context, state) {
        if (state is GetAllCategoriesLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GetAllCategoriesSuccessState) {
          List<String> categories = state.data;
          return DefaultTabController(
            length: categories.length + 1,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  isScrollable: true,
                  tabs: buildTabsText(categories: categories),
                ),
                centerTitle: true,
                title: const Text(
                  "New Trend",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline_sharp),
                    onPressed: () {
                      Navigator.pushNamed(context, AddView.id,
                          arguments: categories);
                    },
                  )
                ],
              ),
              body: TabBarView(
                children: buildTabs(categories: categories),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Failed to load categories'),
            ),
          );
        }
      },
    );
  }

  List<Tab> buildTabsText({required List<String> categories}) {
    List<Tab> tabsIcon = [
      const Tab(
        child: Text('All'),
      ),
    ];
    for (var category in categories) {
      tabsIcon.add(
        Tab(
          child: Text(category[0].toUpperCase() + category.substring(1)),
        ),
      );
    }
    return tabsIcon;
  }

  List<Widget> buildTabs({required List<String> categories}) {
    List<Widget> tabs = [];
    BlocProvider.of<GetAllProductsCubit>(context).getAllProducts();
    tabs.add(allProductsFutureBuilder());
    for (var category in categories) {
      tabs.add(categoryFutureBuilder(category));
    }
    return tabs;
  }

  Widget allProductsFutureBuilder() {
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

  FutureBuilder<List<ProductModel>> categoryFutureBuilder(String category) {
    return FutureBuilder<List<ProductModel>>(
      future: GetCategoryService().getProducts(category),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = snapshot.data!;
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
