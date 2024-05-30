import 'package:codedelaroute/app/modules/profile/views/achievements_screen.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/container_widget.dart';
import '../../../views/widgets/title_widget.dart';
import '../../auth/controllers/auth_controller.dart';
import '../controllers/profile_controller.dart';
import 'profile_stats_view.dart';

class ProfileView extends GetView<ProfileController> {
  final authController = Get.find<AuthController>();

  ProfileView({super.key});

  String buildUserName() {
    if (authController.isAuth) {
      return authController.authUser?.displayName ??
          authController.authUser?.email ??
          "user name".tr;
    }
    return "username";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        children: [
          TitleWidget(title: "profile".tr),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Column(
                  children: [
                    const SizedBox(
                      width: 100,
                      height: 100,
                      child: ContainerWidget(
                        borderRadius: 100,
                        child: Center(child: Icon(Ionicons.person, size: 50)),
                      ),
                    ),
                    Obx(
                      () => Text(buildUserName(),
                          style: const TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(height: 10),
                    const ProfileStatsView(),
                    const SizedBox(height: 10),
                    ContainerWidget(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _rankWidget(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "achievements".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 23),
                ),
                Expanded(
                    child: AchievementsScreen(user: authController.authUser)),
                const SizedBox(height: 15),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(Routes.SETTINGS),
                        child: ContainerWidget(
                          child: Row(
                            children: [
                              Text("settings".tr),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(Ionicons.settings_outline),
                            ],
                          ),
                        ),
                      ),
                      if (authController.isAuth) const SizedBox(width: 15),
                      if (authController.isAuth)
                        InkWell(
                          onTap: () => authController.logOut(),
                          child: ContainerWidget(
                            child: Row(
                              children: [
                                Text("logout".tr),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Ionicons.log_out_outline),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const BackNavButton(padding: 5),
        ],
      ),
    ));
  }

  Widget _rankWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("your_rank".tr),
            const Text("Traffic Titan"),
          ],
        ),
        Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(10),
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/badges/badge_green.png",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              child: const Center(
                  child: Text(
                "5",
                style: TextStyle(fontSize: 20),
              ))),
        ),
      ],
    );
  }
}
