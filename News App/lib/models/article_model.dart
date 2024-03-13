class ArticleModel {
  final String title;
  final String? subtitle;
  final String? imagePath;
  final String? articleLink;

  ArticleModel(
      {required this.title,
      required this.subtitle,
      required this.imagePath,
      required this.articleLink});

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
        title: json['title'],
        subtitle: json['description'],
        imagePath: json['urlToImage'],
        articleLink: json['url']);
  }
}
