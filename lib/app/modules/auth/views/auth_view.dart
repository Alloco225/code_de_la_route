import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../submodules/login/views/login_view.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}
