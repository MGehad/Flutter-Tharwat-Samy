import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import '../constants.dart';
import 'add_text_button.dart';
import 'app_text_form_field.dart';
import 'color_list_view.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidate,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 50, child: ColorListView(models: colorCircles)),
          const SizedBox(height: 30.0),
          AppTextFormField(
            label: "Title",
            maxLines: 1,
            textEditingController: titleController,
          ),
          const SizedBox(height: 20.0),
          AppTextFormField(
            label: "Content",
            maxLines: 5,
            textEditingController: subtitleController,
          ),
          const SizedBox(height: 35.0),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => AddTextButton(
              isLoading: state is AddNoteLoadingState,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  int? color;
                  for (var element in colorCircles) {
                    if (element.isSelected) {
                      color = element.color.value;
                    }
                  }
                  if (color != null) {
                    NoteModel model = NoteModel(
                        title: titleController.text,
                        subtitle: subtitleController.text,
                        date: DateTime.now().toString().substring(0, 16),
                        color: color);
                    BlocProvider.of<AddNoteCubit>(context).addNote(model);
                  }
                } else {
                  autovalidate = AutovalidateMode.always;
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
