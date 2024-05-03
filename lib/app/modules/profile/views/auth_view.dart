import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../auth/submodules/login/views/login_view.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}
