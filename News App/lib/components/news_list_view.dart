import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/components/news_card.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsListView extends StatelessWidget {
  List<ArticleModel> articles;

  NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: articles.length,
      (context, index) {
        return NewsTile(model: articles[index]);
      },
    ));
  }
}
