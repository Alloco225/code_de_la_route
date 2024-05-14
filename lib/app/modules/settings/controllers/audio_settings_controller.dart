import 'package:get/get.dart';

class AudioSettingsController extends GetxController {
  final _sound = true.obs;
  final _music = true.obs;

  bool get isMusicOn => _music.value == true;
  bool get isSoundOn => _sound.value == true;

  toggleSound() {
    _sound.value = !_sound.value;
  }

  toggleMusic() {
    _music.value = !_music.value;
  }
}
