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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleWidget(title: "settings".tr),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    child: const Column(
                      children: [
                        CircleAvatar(),
                        Text("Username"),
                        Row(
                          children: [
                            Text("Rank : 1"),
                            Text("Points : 2"),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("delete_account"),
                        ),
                        ListTile(
                          title: Text("logout"),
                        ),
                        ListTile(
                          title: Text("achievements"), // TODO
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
}
