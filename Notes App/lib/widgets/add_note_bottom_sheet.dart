import 'package:flutter/material.dart';
import 'package:notes_app/models/color_model.dart';
import 'add_text_button.dart';
import 'app_text_field.dart';
import 'color_list_view.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<ColorModel> models = [
      ColorModel(color: Colors.orangeAccent, isSelected: false),
      ColorModel(color: Colors.indigo, isSelected: false),
      ColorModel(color: Colors.indigoAccent, isSelected: false),
      ColorModel(color: Colors.brown, isSelected: false),
      ColorModel(color: Colors.deepPurple, isSelected: false),
      ColorModel(color: Colors.green, isSelected: false),
      ColorModel(color: Colors.redAccent, isSelected: false),
    ];
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ColorListView(models: models),
              ),
              const SizedBox(
                height: 30.0,
              ),
              AppTextField(
                label: "Title",
                maxLines: 1,
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppTextField(
                label: "Content",
                maxLines: 5,
              ),
              const SizedBox(
                height: 40.0,
              ),
              const AddTextButton()
            ],
          ),
        );
      },
    );
  }
}
