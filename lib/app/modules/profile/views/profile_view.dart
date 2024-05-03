import 'package:codedelaroute/app/modules/profile/views/user_profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/views/auth_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isAuth ? const UserProfileView() : const AuthView(),
    );
  }
}
