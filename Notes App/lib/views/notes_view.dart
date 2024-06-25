import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_note_cubit/get_note_cubit.dart';
import '../widgets/note_floating_action_button.dart';
import '../widgets/notes_list_view.dart';

class NotesView extends StatefulWidget {
  final VoidCallback toggleDarkMode;

  const NotesView({super.key, required this.toggleDarkMode});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<GetNoteCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: const NoteFloatingActionButton(),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: NotesListView(),
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
                onPressed: widget.toggleDarkMode,
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
