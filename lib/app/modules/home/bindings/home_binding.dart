import 'package:codedelaroute/app/modules/settings/controllers/audio_settings_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/language_settings_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/settings_controller.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LanguageSettingsController>(
      LanguageSettingsController(),
    );
    Get.put<AudioSettingsController>(
      AudioSettingsController(),
    );
    Get.put<SettingsController>(
      SettingsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
