import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/category_view.dart';
import '../models/category_model.dart';

class CategoryCard extends StatefulWidget {
  final CategoryModel model;

  const CategoryCard({super.key, required this.model});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CategoryView(category: widget.model.text);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(widget.model.imagePath),
            ),
          ),
          child: Center(
              child: Text(widget.model.text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
