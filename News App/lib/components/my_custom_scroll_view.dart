import 'package:flutter/material.dart';
import 'categories_listview.dart';
import 'news_list_view_builder.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CategoriesListView()),
        SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        NewsListViewBuilder(category: 'top'),
      ],
    );
  }
}
