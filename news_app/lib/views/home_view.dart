import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/NewsListViewBuilder.dart';
import '../components/categories_listview.dart';

class MyHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "News",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Cloud",
            style: TextStyle(color: Colors.amber),
          )
        ]),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            NewsListViewBuilder(category: 'sports'),
          ],
        ),
      ),
    );
  }
}
