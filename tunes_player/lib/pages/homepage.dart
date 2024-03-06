import 'package:flutter/material.dart';
import 'package:music_notes_player_app_setup/models/tune_model.dart';
import '../components/tune_container.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TuneModel> tunes = const [
      TuneModel(audioPath: "note1.wav", color: Color(0xffF44336)),
      TuneModel(audioPath: "note2.wav", color: Color(0xffF89800)),
      TuneModel(audioPath: "note3.wav", color: Color(0xffFEEB3B)),
      TuneModel(audioPath: "note4.wav", color: Color(0xff4CAF50)),
      TuneModel(audioPath: "note5.wav", color: Color(0xff2F9688)),
      TuneModel(audioPath: "note6.wav", color: Color(0xff2896F3)),
      TuneModel(audioPath: "note7.wav", color: Color(0xff9C27B0))
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff253238),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Flutter Tune",
        ),
      ),
      body: Column(
        children: tunes
            .map(
              (model) => TuneContainer(model: model),
            )
            .toList(),
      ),
    );
  }
}
