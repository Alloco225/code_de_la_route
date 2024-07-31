import 'package:codedelaroute/app/modules/profile/views/achievements_screen.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../views/widgets/container_widget.dart';
import '../../../views/widgets/title_widget.dart';
import '../../auth/controllers/auth_controller.dart';
import '../controllers/profile_controller.dart';
import 'profile_stats_view.dart';

class ProfileView extends GetView<ProfileController> {
  final authController = Get.find<AuthController>();

  ProfileView({super.key});

  buildUserProfileImage() {
    return SizedBox(
      width: 100,
      height: 100,
      child: ContainerWidget(
        borderRadius: 100,
        padding:
            authController.isAuth == false ? null : const EdgeInsets.all(5),
        child: authController.isAuth == false
            ? const Center(child: Icon(Ionicons.person, size: 50))
            : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  authController.authUser?.photoURL ?? '',
                  errorBuilder: (ctx, _, __) => Container(
                      color: Colors.blueGrey.shade700,
                      child: const Icon(Ionicons.person_outline, size: 50)),
                )),
      ),
    );
  }

  String buildUserName() {
    if (authController.isAuth) {
      return authController.authUser?.displayName ??
          authController.authUser?.email ??
          '';
    }
    return "guest".tr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Ionicons.chevron_back,
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
                  Text(
                    "profile".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.SETTINGS),
                      child: const ContainerWidget(
                        child: Row(
                          children: [
                            Icon(Ionicons.settings_outline),
                          ],
                        ),
                      ),
                    ),
                    if (authController.isAuth) const SizedBox(width: 15),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      buildUserProfileImage(),
                      Obx(
                        () => Text(buildUserName(),
                            style: const TextStyle(fontSize: 20)),
                      ),
                      const SizedBox(height: 10),
                      if (authController.isAuth) const ProfileStatsView(),
                      const SizedBox(height: 10),
                      // if (authController.isAuth)
                      //   ContainerWidget(
                      //     padding: const EdgeInsets.symmetric(horizontal: 10),
                      //     child: _rankWidget(),
                      //   ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "achievements".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 23),
                  ),
                  Expanded(
                    child: Obx(() =>
                        AchievementsScreen(user: authController.authUser)),
                  ),
                ],
              ),
            ),
          ),
          // const BackNavButton(padding: 5),
        ],
      ),
    ));
  }

  Widget _rankWidget() {
    // String rankTitle = "your_rank".tr;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("your_rank".tr),
            Text("traffic_titan".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
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
