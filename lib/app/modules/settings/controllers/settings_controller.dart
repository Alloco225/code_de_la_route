import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/modules/auth/services/auth_service.dart';
import 'package:codedelaroute/app/modules/settings/controllers/audio_settings_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/language_settings_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/theme_settings_controller.dart.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final audio = Get.find<AudioSettingsController>();
  final lang = Get.find<LanguageSettingsController>();
  final theme = Get.find<ThemeSettingsController>();

  final authService = Get.find<AuthService>();
  final auth = Get.find<AuthController>();

  //
}
