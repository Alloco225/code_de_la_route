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
                  Container(
                    child: Column(
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
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "achievements".tr,
                          style: const TextStyle(fontSize: 23),
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 5,
                            children: List.generate(4, (index) {
                              return const ContainerWidget();
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text("Profile Contents"),
                  const Spacer(),
                ],
              ),
            ),
            const BackNavButton(),
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
