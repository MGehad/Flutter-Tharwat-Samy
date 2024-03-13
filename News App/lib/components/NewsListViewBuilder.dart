import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/news_list_view.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import '../services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  String category;

  NewsListViewBuilder({super.key, required this.category});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var articles;

  @override
  void initState() {
    super.initState();
    articles = NewsService(category: widget.category.toLowerCase()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
            "Error 404",
            style: TextStyle(
                fontSize: 25, color: Colors.amber, fontWeight: FontWeight.w500),
          ));
        } else {
          return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
