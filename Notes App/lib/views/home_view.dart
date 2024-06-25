import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import '../widgets/note_floating_action_button.dart';
import '../widgets/note_widget.dart';

class HomeView extends StatelessWidget {
  final VoidCallback toggleDarkMode;

  const HomeView({super.key, required this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = [];

    return BlocProvider(
      create: (context) => GetNoteCubit(),
      child: Scaffold(
        appBar: buildAppBar(),
        floatingActionButton: const NoteFloatingActionButton(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: ListView.builder(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemCount: notes.length,
            // reverse: true,
            itemBuilder: (context, index) {
              return NoteWidget(
                note: notes[index],
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 28,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                onPressed: toggleDarkMode,
                icon: const Icon(
                  Icons.sunny,
                  size: 28,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          )
        ],
      );
}
