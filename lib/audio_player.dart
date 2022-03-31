import 'package:audioplayers/audioplayers.dart';

class AudioPlayerR {
  late AudioPlayer audioPlayer;
  AudioPlayerR() {
    audioPlayer = AudioPlayer();
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  play(String url) async {
    int result = await audioPlayer.play(url);

    if (result == 0) {
      print("Error");
    }
  }
}
