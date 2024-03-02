import 'package:audioplayers/audioplayers.dart';

class ItemModel {
  String? imagePath;
  String title;
  String subtitle;
  String audioPath;

  ItemModel(
      {this.imagePath,
      required this.title,
      required this.subtitle,
      required this.audioPath});

  void playSound() {
    AudioPlayer player = AudioPlayer();
    player.play(AssetSource(audioPath));
  }
}
