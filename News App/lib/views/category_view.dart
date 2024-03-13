import 'package:flutter/material.dart';

import '../components/NewsListViewBuilder.dart';

class CategoryView extends StatelessWidget {
  String category;

  CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0,
          centerTitle: true,
          title: Text(category)),
      body: CustomScrollView(
        slivers: [NewsListViewBuilder(category: category)],
      ),
    );
  }
}
