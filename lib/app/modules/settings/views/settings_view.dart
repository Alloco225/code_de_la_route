import 'package:auto_size_text/auto_size_text.dart';
import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/modules/settings/views/language_settings_modal_view.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:codedelaroute/app/views/ui/snackbar.dart';
import 'package:codedelaroute/app/views/widgets/fancy_button_widget.dart';
import 'package:codedelaroute/app/views/widgets/title_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../helpers/utils.dart';
import '../../../views/widgets/bottom_sheet_modal_widget.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({super.key});
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleWidget(
              title: "settings".tr,
              gap: 5,
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  Obx(
                    () => buildSettingTile(
                      title: "language".tr,
                      icon: Ionicons.globe_outline,
                      value: (controller.lang.selectedLanguage?.emoji ?? '')
                          .toUpperCase(),
                      flex: 1,
                      onTap: () => showMaterialModalBottomSheet(
                        expand: false,
                        enableDrag: false,
                        isDismissible: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => LanguageSettingsModalView(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // buildSettingTile(
                  //   title: "audio".tr,
                  //   icon: Ionicons.musical_note_outline,
                  //   value: null,
                  //   flex: 1,
                  //   onTap: () => openSettingsModal(AudioSettingsModalView(),
                  //       context: context),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // buildSettingTile(
                  //   title: "theme".tr,
                  //   icon: Ionicons.sunny_outline,
                  //   value: "dark".tr,
                  //   flex: 0,
                  //   onTap: () => openSettingsModal(ThemeSettingsModalView(),
                  //       context: context),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  buildSettingTile(
                      flex: 1,
                      title: "delete_data".tr,
                      icon: Ionicons.trash_outline,
                      onTap: () async {
                        openSettingsModal(
                            BottomSheetModalWidget(
                              maxHeight: .4,
                              title: 'delete_data_question'.tr,
                              child: const DeleteAccountConfirmation(),
                            ),
                            context: context);
                      }),
                  const SizedBox(height: 15),
                  Obx(() => auth.isAuth
                      ? buildSettingTile(
                          flex: 1,
                          title: "logout".tr,
                          icon: Ionicons.log_out_outline,
                          onTap: () async {
                            // await show
                            openSettingsModal(
                                BottomSheetModalWidget(
                                  maxHeight: .3,
                                  title: 'logout_question'.tr,
                                  child: const LogoutModalConfirmation(),
                                ),
                                context: context);
                          })
                      : Container()),
                  if (auth.isAuth)
                    const SizedBox(
                      height: 15,
                    ),
                  const Spacer(),
                ],
              ),
            ),
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
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade800,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 35,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                if (value != null) const SizedBox(width: 10),
                if (value != null)
                  Text(
                    value,
                    textAlign: TextAlign.center,
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

class DeleteAccountConfirmation extends StatefulWidget {
  const DeleteAccountConfirmation({super.key});

  @override
  State<DeleteAccountConfirmation> createState() =>
      _DeleteAccountConfirmationState();
}

class _DeleteAccountConfirmationState extends State<DeleteAccountConfirmation> {
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            'delete_data_confirmation'.tr,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
          Row(
            children: [
              FancyButtonWidget(
                title: 'delete'.tr,
                color: 'red',
                onTap: () async {
                  // await auth.deleteUserAccount();
                  await auth.deleteUserAccountData();

                  ProfileController profileController =
                      Get.find<ProfileController>();
                  profileController.resetStats();

                  showSnackbarSuccess("data_deleted".tr, context: context);

                  Get.toNamed(Routes.HOME);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              FancyButtonWidget(
                title: 'cancel'.tr,
                color: 'grey',
                onTap: () => Get.back(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LogoutModalConfirmation extends StatefulWidget {
  const LogoutModalConfirmation({super.key});

  @override
  State<LogoutModalConfirmation> createState() =>
      _LogoutModalConfirmationState();
}

class _LogoutModalConfirmationState extends State<LogoutModalConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'logout_confirmation'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
          Row(
            children: [
              FancyButtonWidget(
                title: 'logout'.tr,
                color: 'red',
                onTap: () async {
                  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                  await firebaseAuth.signOut();
                  showSnackbarSuccess("logged_out".tr, context: context);
                  Get.back();
                },
              ),
              const SizedBox(
                width: 10,
              ),
              FancyButtonWidget(
                title: 'cancel'.tr,
                color: 'grey',
                onTap: () => Get.back(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
