import 'package:code_de_la_route/app/controllers/auth_controller.dart';
import 'package:code_de_la_route/app/modules/profile/views/user_profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'auth_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Obx(
        () => controller.isAuth ? const UserProfileView() : const AuthView(),
    );
  }
}
