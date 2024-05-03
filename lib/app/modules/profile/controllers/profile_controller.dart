import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final authController = AuthController();

  bool get isAuth => authController.isAuth;

  final count = 0.obs;

  void increment() => count.value++;
}
