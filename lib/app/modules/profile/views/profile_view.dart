import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/container_widget.dart';
import '../../../views/widgets/title_widget.dart';
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
                      const ContainerWidget(
                        borderRadius: 100,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const Text("Username", style: TextStyle(fontSize: 20)),
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
                  _buildAchievements(),
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

  Widget _buildAchievements() {
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

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "achievements".tr,
            style: const TextStyle(fontSize: 23),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: .9,
              children: List.generate(achievements.length, (index) {
                return ContainerWidget(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const SizedBox(height: 5),
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
          ),
        ],
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
