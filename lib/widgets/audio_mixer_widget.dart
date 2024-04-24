import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioMixer extends InheritedWidget {
  final AudioPlayer bgmPlayer = AudioPlayer();
  final AudioPlayer soundEffectsPlayer = AudioPlayer();
  // final AudioCache soundEffectsPlayer = AudioCache(prefix: 'assets/sounds/');

  AudioMixer({super.key, required super.child});

  static AudioMixer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AudioMixer>();
  }

  void playBgm(String bgmPath) async {
    print("playBgm path$bgmPath");

    await bgmPlayer.stop();

    await bgmPlayer.play(AssetSource(bgmPath), mode: PlayerMode.lowLatency);
  }

  void stopBgm() async {
    await bgmPlayer.stop();
  }

  void playSoundEffect(String soundEffectPath) {
    soundEffectsPlayer.play(AssetSource(soundEffectPath));
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
