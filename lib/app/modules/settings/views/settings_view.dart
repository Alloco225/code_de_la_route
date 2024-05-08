import 'package:codedelaroute/app/views/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(), // 07 08 18 20 20
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(fontSize: 40),
                  ),
                  Expanded(
                    child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15),
                        children: [
                          buildSettingTile(
                              "Musique", Ionicons.musical_note_outline, "OUI"),
                          buildSettingTile(
                              "Langue", Ionicons.globe_outline, "FR"),
                        ]),
                  ),
                  ButtonWidget(
                      text: "Retour",
                      onPressed: () {
                        Get.back();
                      })
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  buildSettingTile(String title, IconData icon, String value) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon),
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
