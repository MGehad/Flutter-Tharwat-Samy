import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/category_view.dart';
import '../models/category_model.dart';

class CategoryCard extends StatefulWidget {
  CategoryModel model;

  CategoryCard({super.key, required this.model});

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
          height: 130,
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(widget.model.imagePath),
            ),
          ),
          child: Center(
              child: Text(widget.model.text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
