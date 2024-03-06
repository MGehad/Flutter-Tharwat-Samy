import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TuneModel {
  final Color color;
  final String audioPath;

  const TuneModel({required this.audioPath, required this.color});

  void playSound() {
    AudioPlayer player = AudioPlayer();
    player.play(AssetSource(audioPath));
  }
}
