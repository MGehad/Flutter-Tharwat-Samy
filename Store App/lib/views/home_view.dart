import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import '../cubits/get_all_categories_cubit/get_all_categories_state.dart';
import '../cubits/get_all_products_cubit/get_all_products_cubit.dart';
import '../widgets/all_products_grid_view.dart';
import '../widgets/products_grid_view.dart';
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
    List<Tab> tabs = [
      const Tab(
        child: Text('All'),
      ),
    ];
    for (var category in categories) {
      tabs.add(
        Tab(
          child: Text(category[0].toUpperCase() + category.substring(1)),
        ),
      );
    }
    return tabs;
  }

  List<Widget> buildTabs({required List<String> categories}) {
    List<Widget> tabs = [];
    BlocProvider.of<GetAllProductsCubit>(context).getAllProducts();
    tabs.add(const AllProductsGridView());
    for (var category in categories) {
      tabs.add(ProductsGridView(category: category));
    }
    return tabs;
  }
}
