import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewArticle extends StatelessWidget {
  ArticleModel model;

  WebViewArticle({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(model.title),
          elevation: 0,
          backgroundColor: Colors.amber),
      body: WebView(
        initialUrl: model.articleLink,
      ),
    );
  }
}
