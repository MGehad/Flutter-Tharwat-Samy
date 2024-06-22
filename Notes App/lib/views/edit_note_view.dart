import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/note_model.dart';
import '../widgets/app_text_field.dart';
import '../widgets/color_list_view.dart';

class EditNoteView extends StatelessWidget {
  NoteModel note;

  EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: note.title);
    TextEditingController subtitleController =
        TextEditingController(text: note.subtitle);
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 25.0, right: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50, child: ColorListView(models: colorCircles)),
            const SizedBox(
              height: 30.0,
            ),
            AppTextField(
              label: "Title",
              maxLines: 1,
              textEditingController: titleController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            AppTextField(
              label: "Content",
              maxLines: 5,
              textEditingController: subtitleController,
            ),
            const SizedBox(
              height: 35.0,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        title: const Text(
          'Edit Note',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 28,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          )
        ],
      );
}
