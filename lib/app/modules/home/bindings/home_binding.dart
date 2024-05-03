import 'package:code_de_la_route/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
