import 'package:flutter/material.dart';
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
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidate = AutovalidateMode.always;

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
          const SizedBox(
            height: 30.0,
          ),
          AppTextFormField(
            label: "Title",
            maxLines: 1,
            textEditingController: controller1,
          ),
          const SizedBox(
            height: 20.0,
          ),
          AppTextFormField(
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
                if (formKey.currentState!.validate()) {
                } else {
                  autovalidate = AutovalidateMode.always;
                }
              });
            },
          )
        ],
      ),
    );
  }
}
