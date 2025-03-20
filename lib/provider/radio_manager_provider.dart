import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioManagerProvider extends ChangeNotifier {
  String? currentPlayingUrl;
  bool isPlaying = false;
  double currentVolume = 2.0;
  AudioPlayer player = AudioPlayer();

  Future<void> play(String url) async {
    if (currentPlayingUrl == url) {
      isPlaying ? await player.pause() : await player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentPlayingUrl = url;
      await player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
    }
    notifyListeners();
  }

  Future<void> stop() async {
    await player.stop();
    currentPlayingUrl = null;
    isPlaying = false;
    notifyListeners();
  }

  Future<void> setVolume(double volume) async {
    currentVolume = volume;
    await player.setVolume(volume);
    notifyListeners();
  }
}
