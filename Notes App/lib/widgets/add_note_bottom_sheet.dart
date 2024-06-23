import 'package:flutter/material.dart';
import '../constants.dart';
import 'add_text_button.dart';
import 'app_text_field.dart';
import 'color_list_view.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 50, child: ColorListView(models: colorCircles)),
                const SizedBox(
                  height: 30.0,
                ),
                AppTextField(
                  label: "Title",
                  maxLines: 1,
                  textEditingController: controller1,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AppTextField(
                  label: "Content",
                  maxLines: 5,
                  textEditingController: controller2,
                ),
                const SizedBox(
                  height: 35.0,
                ),
                AddTextButton(
                  onPressed: () {
                    setState(() {
                     /* Color color = Colors.redAccent;
                      for (var element in colorCircles) {
                        if (element.isSelected) {
                          color = element.color;
                        }
                      }
                      NotesData.addNote(
                        NoteModel(
                            title: controller1.text,
                            subtitle: controller2.text,
                            date: DateTime.now().toString(),
                            color: color),
                      );*/
                    });
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
