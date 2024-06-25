import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_note_cubit/get_note_cubit.dart';
import 'notes_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: (darkMode) ? Brightness.dark : Brightness.light,
          useMaterial3: true,
        ),
        home: NotesView(
          toggleDarkMode: () {
            setState(() {
              darkMode = !darkMode;
            });
          },
        ),
      ),
    );
  }
}
