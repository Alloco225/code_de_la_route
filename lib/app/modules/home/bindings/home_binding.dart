import 'package:code_de_la_route/app/controllers/auth_controller.dart';
import 'package:code_de_la_route/app/modules/auth/submodules/login/controllers/login_controller.dart';
import 'package:code_de_la_route/app/modules/auth/submodules/register/controllers/register_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
