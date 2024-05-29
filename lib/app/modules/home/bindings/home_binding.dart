import 'package:codedelaroute/app/modules/panneaux_categories/controllers/panneaux_categories_controller.dart';
import 'package:codedelaroute/app/modules/quizz_list/controllers/quizz_list_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/audio_settings_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/language_settings_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/settings_controller.dart';

import '/app/modules/auth/submodules/login/controllers/login_controller.dart';
import '/app/modules/auth/submodules/register/controllers/register_controller.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<QuizzListController>(
      QuizzListController(),
    );
    Get.put<AuthController>(
      AuthController(),
    );
    Get.put<LanguageSettingsController>(
      LanguageSettingsController(),
    );
    Get.put<AudioSettingsController>(
      AudioSettingsController(),
    );
    Get.put<SettingsController>(
      SettingsController(),
    );
    Get.put<LoginController>(
      LoginController(),
    );
    Get.put<RegisterController>(
      RegisterController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
