import 'package:codedelaroute/app/modules/auth/submodules/auth/views/auth_modal_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../views/ui/snackbar.dart';
import '../../../views/widgets/container_widget.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../auth/submodules/login/views/login_modal_view.dart';

class AchievementsGridView extends StatefulWidget {
  const AchievementsGridView({super.key});

  @override
  State<AchievementsGridView> createState() => _AchievementsGridViewState();
}

class _AchievementsGridViewState extends State<AchievementsGridView> {
  final authController = Get.find<AuthController>();

  List achievements = [
    {
      "name": "Social Sharer",
      "image": "assets/badges/badge_red.png",
      "description": "sharer_description",
      "unlocked": true,
      "icon": Ionicons.arrow_redo,
    },
    {
      "name": "Pavement Pupil",
      "image": "assets/badges/badge_green.png",
      "description": "beginner_description",
      "unlocked": false,
      "icon": Ionicons.ribbon,
    },
    {
      "name": "Asphalt Apprentice",
      "image": "assets/badges/badge_silver.png",
      "description": "intermediate_description",
      "unlocked": false,
      "icon": Ionicons.medal,
    },
    {
      "name": "Highway Hero",
      "image": "assets/badges/badge_brown.png",
      "description": "expert_description",
      "unlocked": false,
      "icon": Ionicons.golf,
    },
    {
      "name": "Traffic Titan",
      "image": "assets/badges/badge_orange.png",
      "description": "expert_description",
      "unlocked": false,
      "icon": Ionicons.diamond,
    },
    {
      "name": "Roadmaster Royalty",
      "image": "assets/badges/badge_yellow.png",
      "description": "expert_description",
      "unlocked": false,
      "icon": Ionicons.earth,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Obx(() => _achievementGrid()));
  }

  __buildAchievementsSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "achievements".tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 23),
        ),
        _achievementGrid(),
      ],
    );
  }

  _achievementGrid() {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.symmetric(vertical: 5),
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: .9,
        children: List.generate(achievements.length, (index) {
          return ContainerWidget(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          achievements[index]["image"],
                          fit: BoxFit.contain,
                        ),
                      ),
                      if (achievements[index]["icon"] != null)
                        Positioned.fill(
                          child: Icon(
                            achievements[index]["icon"],
                          ),
                        ),
                    ],
                  ),
                ),
                Column(
                  children: (achievements[index]["name"] as String)
                      .split(" ")
                      .map((t) => Text(
                            t,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
