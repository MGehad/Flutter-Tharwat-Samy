import 'package:flutter/cupertino.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        imagePath: "assets/topNews.jpeg",
        text: "Top",
      ),
      CategoryModel(
        imagePath: "assets/business.jpeg",
        text: "Business",
      ),
      CategoryModel(
        imagePath: "assets/entertainment.jpeg",
        text: "Entertainment",
      ),
      CategoryModel(
        imagePath: "assets/sports.jpeg",
        text: "Sports",
      ),
      CategoryModel(
        imagePath: "assets/health.avif",
        text: "Health",
      ),
      CategoryModel(
        imagePath: "assets/science.avif",
        text: "Science",
      ),
      CategoryModel(
        imagePath: "assets/technology.jpeg",
        text: "Technology",
      ),
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(model: categories[index]);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
