import 'package:codedelaroute/app/modules/settings/views/audio_settings_modal_view.dart';
import 'package:codedelaroute/app/modules/settings/views/language_settings_modal_view.dart';
import 'package:codedelaroute/app/views/ui/snackbar.dart';
import 'package:codedelaroute/app/views/widgets/title_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../helpers/utils.dart';
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
            TitleWidget(title: "settings".tr),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  // Obx(
                  //   () => buildSettingTile(
                  //       title: "profile".tr,
                  //       icon: Ionicons.person,
                  //       value: (controller.auth.isAuth
                  //               ? "logged_in"
                  //               : "logged_out")
                  //           .tr,
                  //       onTap: () async {
                  //         if (controller.auth.isAuth) {
                  //           // showSnackbarSuccess("Already logged in",
                  //           //     context: context);
                  //           Get.toNamed(Routes.PROFILE);
                  //           return;
                  //         }

                  //         bool? loggedIn = await showMaterialModalBottomSheet(
                  //           expand: false,
                  //           context: context,
                  //           backgroundColor: Colors.transparent,
                  //           // builder: (context) => const ModalInsideModal());
                  //           builder: (context) => LoginModalView(),
                  //         );
                  //         if (loggedIn == true) {
                  //           showSnackbarSuccess("User in !", context: context);
                  //         } else {
                  //           showSnackbarError("Could not log in !",
                  //               context: context);
                  //         }
                  //       }),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     buildSettingTile(
                  //       title: "theme".tr,
                  //       icon: Ionicons.sunny_outline,
                  //       value: "dark".tr,
                  //       flex: 0,
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    buildSettingTile(
                      title: "music".tr,
                      icon: Ionicons.musical_note_outline,
                      value: null,
                      flex: 1,
                      onTap: () => openSettingsModal(AudioSettingsModalView(),
                          context: context),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Obx(
                      () => buildSettingTile(
                        title: "language".tr,
                        icon: Ionicons.globe_outline,
                        value: (controller.lang.selectedLanguage?.id ?? '')
                            .toUpperCase(),
                        flex: 1,
                        // onTap: () => showMaterialModalBottomSheet(
                        //       expand: false,
                        //       enableDrag: false,
                        //       isDismissible: true,
                        //       context: context,
                        //       backgroundColor: Colors.transparent,
                        //       builder: (context) =>
                        //           LanguageSettingsModalView(),
                        //     )),
                        onTap: () => showSnackbarInfo(
                            "La traduction sera disponible dans la prochaine version",
                            context: context),
                      ),
                    ),
                  ]),

                  const SizedBox(
                    height: 15,
                  ),
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

  Widget buildSettingTile({
    required String title,
    required IconData icon,
    String? value,
    VoidCallback? onTap,
    flex = 0,
  }) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                mainAxisAlignment: value == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  if (value != null) const SizedBox(width: 10),
                  if (value != null)
                    Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalInsideModal extends StatefulWidget {
  final bool reverse;

  const ModalInsideModal({super.key, this.reverse = false});

  @override
  State<ModalInsideModal> createState() => _ModalInsideModalState();
}

class _ModalInsideModalState extends State<ModalInsideModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(
            "login".tr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: const TextField(),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "login".tr,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
