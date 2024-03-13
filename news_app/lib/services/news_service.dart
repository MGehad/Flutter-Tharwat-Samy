import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  String category;

  NewsService({required this.category});

  var dio = Dio();

  Future<List<ArticleModel>> getNews() async {
    try {
      Response response =
          await dio.get("https://newsapi.org/v2/top-headlines?country=us"
              "&apiKey=e95a84d8e15245c7b5c7d0ecf5420397"
              "&category=$category");

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> models = [];

      for (var articleData in articles) {
        ArticleModel article = ArticleModel.fromJson(articleData);
        models.add(article);
      }
      return models;
    } catch (e) {
      return [];
    }
  }
}
