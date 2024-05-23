import 'package:codedelaroute/app/modules/auth/submodules/auth/views/auth_modal_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../views/ui/snackbar.dart';
import '../../../views/widgets/container_widget.dart';
import '../../auth/submodules/login/views/login_modal_view.dart';

class AchievementsView extends StatefulWidget {
  const AchievementsView({super.key});

  @override
  State<AchievementsView> createState() => _AchievementsViewState();
}

class _AchievementsViewState extends State<AchievementsView> {
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
    openAuthModal() async {
      bool? loggedIn = await showMaterialModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        // builder: (context) => const ModalInsideModal());
        builder: (context) => AuthModalView(),
      );
      if (loggedIn == true) {
        showSnackbarSuccess("User in !", context: context);
      } else {
        showSnackbarError("Could not log in !", context: context);
      }
    }

    return Expanded(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "achievements".tr,
                style: const TextStyle(fontSize: 23),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: .9,
                  children: List.generate(achievements.length, (index) {
                    return ContainerWidget(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 0),
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
          Positioned.fill(
              child: ContainerWidget(
            color: Colors.blueGrey.shade800.withOpacity(.9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "authenticate to unlock more achievements",
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  child: const ContainerWidget(
                    child: Text("authenticate"),
                  ),
                  onTap: () => openAuthModal(),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
