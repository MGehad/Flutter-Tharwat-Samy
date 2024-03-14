import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  String category;
  String? word;

  NewsService({required this.category, this.word});

  var dio = Dio();

  Future<List<ArticleModel>> getNews() async {
    try {
      String api =
          "https://newsdata.io/api/1/news?apikey=pub_400093626bdad4aab4d18c2f96d1d0a844c37"
          "&language=ar"
          "&category=$category";
      if (word != null) {
        api = "$api&qInTitle=$word";
      }

      Response response = await dio.get(api);

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['results'];

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
