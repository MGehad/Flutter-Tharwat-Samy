import 'package:flutter/material.dart';
import 'package:store_app/views/add_view.dart';
import '../models/product_model.dart';
import '../services/all_categories_service.dart';
import '../services/all_products_service.dart';
import '../services/get_category_service.dart';
import '../widgets/item_card.dart';

class HomeView extends StatefulWidget {
  static String id = 'home view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var data;

  @override
  void initState() {
    super.initState();
    data = AllCategoriesService()
        .getAllCategories()
        .then((value) => List<String>.from(value));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: Text('Failed to load categories'),
            ),
          );
        } else {
          List<String> categories = snapshot.data!;
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
    tabs.add(allProductsFutureBuilder());
    for (var category in categories) {
      tabs.add(categoryFutureBuilder(category));
    }
    return tabs;
  }

  FutureBuilder<List<ProductModel>> allProductsFutureBuilder() {
    return FutureBuilder<List<ProductModel>>(
      future: AllProductsService().getAllProducts(),
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
