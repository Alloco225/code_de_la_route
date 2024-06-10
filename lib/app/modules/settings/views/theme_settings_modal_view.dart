import 'package:codedelaroute/app/data/extensions.dart';
import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/settings_controller.dart';

class ThemeSettingsModalView extends GetView<SettingsController> {
  ThemeSettingsModalView({super.key});

  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * .2,
          maxHeight: MediaQuery.of(context).size.height * .4,
        ),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade700,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "theme".tr.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Column(
                      children: [
                        _buildSettingTile(
                            icon: Ionicons.sunny,
                            title: "light".tr,
                            active: !controller.theme.isDarkTheme,
                            onTap: () => {
                                  controller.theme.toggleTheme(),
                                }),
                        _buildSettingTile(
                            icon: Ionicons.moon,
                            title: "dark".tr,
                            active: controller.theme.isDarkTheme,
                            onTap: () => {
                                  controller.theme.toggleTheme(),
                                }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      border: Border.all(
                        width: 3,
                        color: Colors.orange.shade700,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "save".tr.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }

  Container _buildSettingTile({
    required IconData icon,
    required String title,
    bool active = true,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white,
          )),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          // (language.id!).tr.toCapitalized(),
          title.tr.toCapitalized(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: !active ? null : Colors.orange,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Icon(
            Icons.check,
            color: !active ? Colors.blueGrey.shade300 : Colors.white,
          ),
        ),
      ),
    );
  }
}