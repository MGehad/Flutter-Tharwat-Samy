import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/constants.dart';
import '../cubits/get_note_cubit/get_note_cubit.dart';
import '../models/note_model.dart';
import '../views/edit_note_view.dart';

class NoteWidget extends StatefulWidget {
  final NoteModel note;

  const NoteWidget({super.key, required this.note});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: slidableButtons(),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNoteView(note: widget.note),
                ));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
            decoration: BoxDecoration(
              color: Color(widget.note.color),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(widget.note.title),
                  ),
                  titleTextStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  subtitle: Text(
                    widget.note.subtitle,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 18.0, top: 8.0, bottom: 2.0),
                  child: Text(
                    widget.note.date,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> slidableButtons() {
    return [
      SlidableAction(
        onPressed: (context) {
          widget.note.delete();
          BlocProvider.of<GetNoteCubit>(context).getAllNotes();
        },
        backgroundColor: const Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
        icon: Icons.delete,
        label: 'Delete',
      ),
      SlidableAction(
        onPressed: (context) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditNoteView(
              note: widget.note,
            ),
          ));
        },
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0)),
        icon: Icons.edit,
        label: 'Edit',
      ),
    ];
  }
}
