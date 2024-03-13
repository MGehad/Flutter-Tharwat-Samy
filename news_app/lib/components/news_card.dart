import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/views/web_view_article.dart';

class NewsTile extends StatelessWidget {
  ArticleModel model;

  NewsTile({required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return WebViewArticle(model: model);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(model.imagePath ??
                  "https://encrypted-tbn0.gstatic.com/images?"
                      "q=tbn:ANd9GcQgZc8Hq5iEEsN5Br94I2wkhogI5l2KZS6KINCamNy0Xg&s"),
            ),
            Text(model.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.black87)),
            Text(model.subtitle ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
