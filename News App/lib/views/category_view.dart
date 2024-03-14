import 'package:flutter/material.dart';
import '../components/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  final String category;

  const CategoryView({super.key, required this.category});

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
