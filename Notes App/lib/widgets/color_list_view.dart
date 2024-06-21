import 'package:flutter/material.dart';
import '../models/color_model.dart';
import 'color_container.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({
    super.key,
    required this.models,
  });

  final List<ColorModel> models;

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.models.length,
      itemBuilder: (context, index) {
        return ColorContainer(
          colorModel: widget.models[index],
          onTap: () {
            setState(() {
              for (var model in widget.models) {
                model.isSelected = false;
              }
              widget.models[index].isSelected = true;
            });
          },
        );
      },
    );
  }
}
