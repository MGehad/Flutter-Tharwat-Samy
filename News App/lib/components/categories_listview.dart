import 'package:flutter/cupertino.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        imagePath: "assets/general.avif",
        text: "Top",
      ),
      CategoryModel(
        imagePath: "assets/business.avif",
        text: "Business",
      ),
      CategoryModel(
        imagePath: "assets/entertaiment.avif",
        text: "Entertainment",
      ),
      CategoryModel(
        imagePath: "assets/sports.avif",
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
