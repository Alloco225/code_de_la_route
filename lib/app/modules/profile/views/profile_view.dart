import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            TitleWidget(title: "profile".tr),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 50),
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
                      const SizedBox(height: 20),
                      ContainerWidget(
                        child: Row(
                          children: [
                            Expanded(child: _buildStatItem("Signs", "0/5")),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(child: _buildStatItem("Quizzes", "0/5")),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: _buildStatItem("Moyenne", "20/20"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ContainerWidget(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rank:"),
                            Text("Traffic Titan"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildAchievements(),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            const BackNavButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievements() {
    List achievements = [
      {
        "name": "beginner",
        "image": "assets/images/achievements/beginner.png",
        "description": "beginner_description",
        "unlocked": false,
      },
      {
        "name": "intermediate",
        "image": "assets/images/achievements/intermediate.png",
        "description": "intermediate_description",
        "unlocked": false,
      },
      {
        "name": "expert",
        "image": "assets/images/achievements/expert.png",
        "description": "expert_description",
        "unlocked": false,
      },
      {
        "name": "sharer",
        "image": "assets/images/achievements/sharer.png",
        "description": "sharer_description",
        "unlocked": true
      },
    ];

    return Expanded(
      child: Column(
        children: [
          Text(
            "achievements".tr,
            style: const TextStyle(fontSize: 23),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(achievements.length, (index) {
                return ContainerWidget(
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.asset(achievements[index]["image"])),
                      const SizedBox(height: 5),
                      Text(
                        achievements[index]["name"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
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
