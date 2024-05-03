import 'package:code_de_la_route/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final authController = AuthController();

  bool get isAuth => authController.isAuth;

  final count = 0.obs;

  void increment() => count.value++;
}
