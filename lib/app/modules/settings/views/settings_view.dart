import 'package:codedelaroute/app/views/widgets/button_widget.dart';
import 'package:codedelaroute/app/views/widgets/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../views/widgets/back_nav_button.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleWidget(title: "Settings"),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  buildSettingTile(
                    title: "Theme",
                    icon: Ionicons.sunny_outline,
                    value: "Sombre",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    buildSettingTile(
                        title: "Musique",
                        icon: Ionicons.musical_note_outline,
                        value: "OUI",
                        flex: 1),
                    const SizedBox(
                      width: 15,
                    ),
                    buildSettingTile(
                        title: "Langue",
                        icon: Ionicons.globe_outline,
                        value: "FR",
                        flex: 1),
                  ]),
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

  buildSettingTile(
      {required String title,
      required IconData icon,
      required String value,
      flex = 0}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade800,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 35,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
          ],
        ),
      ),
    );
  }
}
