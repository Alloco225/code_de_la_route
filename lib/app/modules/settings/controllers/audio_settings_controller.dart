import 'package:codedelaroute/app/data/json_data_provider.dart';
import 'package:codedelaroute/app/data/models/language_model.dart';
import 'package:codedelaroute/app/data/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioSettingsController extends GetxController {
  final _sound = true.obs;
  final _music = true.obs;

  bool get isMusicOn => _music.value == true;
  bool get isSoundOn => _sound.value == true;

  @override
  void onInit() async {
    super.onInit();
    print("Home onInit");

    // TODO get preferences from local db
  }

  toggleSound() {
    _sound.value = !_sound.value;
  }

  toggleMusic() {
    _music.value = !_music.value;
  }
}
