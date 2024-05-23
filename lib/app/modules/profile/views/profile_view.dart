import 'package:codedelaroute/app/modules/profile/views/achievements_view.dart';
import 'package:codedelaroute/app/views/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../views/ui/snackbar.dart';
import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/container_widget.dart';
import '../../../views/widgets/title_widget.dart';
import '../../auth/submodules/login/views/login_modal_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

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
                      const Text("username", style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      ContainerWidget(
                        child: Row(
                          children: [
                            Expanded(child: _buildStatItem("signs".tr, "0/5")),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: _buildStatItem("quizzes".tr, "0/5")),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: _buildStatItem("avg".tr, "20/20"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ContainerWidget(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const AchievementsView(),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            const BackNavButton(padding: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 21),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
