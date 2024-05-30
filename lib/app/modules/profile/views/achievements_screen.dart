import 'dart:developer';

import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/views/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../views/ui/snackbar.dart';
import '../../../views/widgets/container_widget.dart';
import '../../auth/submodules/auth/views/auth_modal_view.dart';

class AchievementsScreen extends StatelessWidget {
  final User? user;

  AchievementsScreen({super.key, required this.user});

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> iconIndex = {
      "Ionicons.arrow_redo": Ionicons.arrow_redo,
      "Ionicons.ribbon": Ionicons.ribbon,
      "Ionicons.medal": Ionicons.medal,
      "Ionicons.golf": Ionicons.golf,
      "Ionicons.diamond": Ionicons.diamond,
      "Ionicons.earth": Ionicons.earth,
    };
    if (user == null) {
      return _buildAuthCTA(context);
    }

    return FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          }
          if (userSnapshot.hasError) {
            return Center(child: Text('Error: ${userSnapshot.error}'));
          }
          if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
            return _buildAuthCTA(context);
          }

          Map<String, dynamic> userData =
              userSnapshot.data!.data() as Map<String, dynamic>;
          Map<String, dynamic> achievements = userData['achievements'] ?? {};

          return FutureBuilder<QuerySnapshot>(
              future:
                  FirebaseFirestore.instance.collection('achievements').get(),
              builder: (context, achievementsSnapshot) {
                if (achievementsSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const LoadingWidget();
                }
                if (achievementsSnapshot.hasError) {
                  return Center(
                      child: Text('Error: ${achievementsSnapshot.error}'));
                }
                if (!achievementsSnapshot.hasData) {
                  return const Center(child: Text('No achievements found.'));
                }

                Map<String, dynamic> userData =
                    userSnapshot.data!.data() as Map<String, dynamic>;
                Map<String, dynamic> userAchievements =
                    userData['achievements'] ?? {};

                return Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: .9,
                    children: achievementsSnapshot.data!.docs.map((doc) {
                      String achievementId = doc.id;
                      Map<String, dynamic> achievementData =
                          doc.data() as Map<String, dynamic>;
                      bool unlocked =
                          userAchievements[achievementId]?['unlocked'] ?? false;

                      return InkWell(
                        onTap: () async {
                          await authController.unlockAchievement(
                              user!.uid, achievementId);
                          log("unlocking achievement");
                        },
                        child: ContainerWidget(
                          padding: EdgeInsets.zero,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Image.asset(
                                              "assets/badges/badge_${achievementData["badge"]}.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          if (achievementData["icon"] != null)
                                            Positioned.fill(
                                              child: Icon(
                                                iconIndex[achievementData[
                                                        "icon"]] ??
                                                    Ionicons.earth,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children:
                                          (achievementData["title"] as String)
                                              .split(" ")
                                              .map((t) => Text(
                                                    t,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ))
                                              .toList(),
                                    ),
                                  ],
                                ),
                              ),
                              if (!unlocked)
                                Positioned.fill(
                                  child: ContainerWidget(
                                      hasBorder: false,
                                      color: Colors.black.withOpacity(.4),
                                      child: Icon(
                                        Ionicons.lock_closed,
                                        color: Colors.white.withOpacity(.9),
                                        size: 42,
                                      )),
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              });
        });
  }

  Widget _buildAuthCTA(context) {
    openAuthModal() async {
      bool? loggedIn = await showMaterialModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        // builder: (context) => const ModalInsideModal());
        builder: (context) => const AuthModalView(),
      );
      if (loggedIn == true) {
        showSnackbarSuccess("User in !", context: context);
      } else {
        showSnackbarError("Could not log in !", context: context);
      }
    }

    return ContainerWidget(
      color: Colors.blueGrey.shade800.withOpacity(.9),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "authenticate to unlock achievements",
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
    );
  }
}
