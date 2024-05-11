import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/modules/auth/services/auth_service.dart';
import 'package:codedelaroute/app/modules/settings/controllers/audio_settings_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/language_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/language_model.dart';
import '../../../data/providers/language_provider.dart';

class SettingsController extends GetxController {
  final audio = Get.find<AudioSettingsController>();
  final lang = Get.find<LanguageSettingsController>();

  final authService = Get.find<AuthService>();
  final auth = Get.find<AuthController>();

  //
}
