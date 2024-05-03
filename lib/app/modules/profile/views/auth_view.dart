import 'package:code_de_la_route/app/controllers/auth_controller.dart';
import 'package:code_de_la_route/app/modules/profile/views/login_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
