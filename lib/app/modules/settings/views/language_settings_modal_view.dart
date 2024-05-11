import 'package:codedelaroute/app/modules/settings/controllers/language_settings_controller.dart';
import 'package:codedelaroute/app/data/extensions.dart';
import 'package:codedelaroute/app/data/models/language_model.dart';
import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LanguageSettingsModalView extends GetView<SettingsController> {
  LanguageSettingsModalView({super.key});

  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * .5,
        maxHeight: MediaQuery.of(context).size.height * .6,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade700,
        // border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(
        () => authController.isAuth
            ? const Text("Already Signed In")
            : Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "language".tr.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                            shrinkWrap: true,
                            children: controller.lang.languages
                                .map((language) => _buildLanguageTile(
                                      language: language,
                                      isSelected: controller.lang
                                          .isLanguageSelected(language),
                                      onTap: () => controller.lang
                                          .selectLanguage(language),
                                    ))
                                .toList()),
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
              ),
      ),
    );
  }

  Container _buildLanguageTile({
    bool isSelected = false,
    required Language language,
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
        leading: Text(
          language.emoji ?? '',
          style: const TextStyle(fontSize: 24),
        ),
        title: Text(
          // (language.id!).tr.toCapitalized(),
          (language.name!).tr.toCapitalized(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: !isSelected
            ? null
            : Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
