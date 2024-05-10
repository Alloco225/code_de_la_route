import 'package:codedelaroute/app/controllers/setting_controller.dart';

import '/app/modules/auth/submodules/login/controllers/login_controller.dart';
import '/app/modules/auth/submodules/register/controllers/register_controller.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
    );
    Get.put<SettingController>(
      SettingController(),
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
