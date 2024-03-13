import 'package:flutter/cupertino.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        imagePath: "assets/entertaiment.avif",
        text: "Entertainment",
      ),
      CategoryModel(
        imagePath: "assets/general.avif",
        text: "General",
      ),
      CategoryModel(
        imagePath: "assets/health.avif",
        text: "Health",
      ),
      CategoryModel(
        imagePath: "assets/business.avif",
        text: "Business",
      ),
      CategoryModel(
        imagePath: "assets/science.avif",
        text: "Science",
      ),
      CategoryModel(
        imagePath: "assets/sports.avif",
        text: "Sports",
      ),
    ];
    return SizedBox(
      height: 130,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(model: categories[index]);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
