import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_note_cubit/get_note_cubit.dart';
import '../models/color_model.dart';
import '../models/note_model.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/color_list_view.dart';
import '../widgets/custom_icon_button.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel note;

  const EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: note.title);
    TextEditingController subtitleController =
        TextEditingController(text: note.subtitle);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Edit Note',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        actions: [
          CustomIconButton(
            icon: Icons.check,
            onPressed: () {
              if (titleController.text != '' && subtitleController.text != '') {
                note.title = titleController.text;
                note.subtitle = subtitleController.text;
                note.color = ColorModel.getSelectedColor()!.value;
                note.save();
                BlocProvider.of<GetNoteCubit>(context).getAllNotes();
                Navigator.pop(context);
              } else {}
            },
          ),
          const SizedBox(width: 12.0)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 25.0, right: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 50,
                child: ColorListView(
                    models: ColorModel.makeColorSelected(note.color))),
            const SizedBox(
              height: 30.0,
            ),
            AppTextFormField(
              label: "Title",
              maxLines: 1,
              textEditingController: titleController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            AppTextFormField(
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
}
