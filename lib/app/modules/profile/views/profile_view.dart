import 'package:codedelaroute/app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../views/widgets/back_nav_button.dart';
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
                  const Spacer(),
                  Container(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                        ),
                        const Text("Username", style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade800,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white,
                              )),
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
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade800,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: const Row(
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
