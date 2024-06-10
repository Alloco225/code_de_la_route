import 'dart:developer';

import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/views/widgets/badge_widget.dart';
import 'package:codedelaroute/app/views/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../views/widgets/container_widget.dart';
import '../../auth/submodules/login/controllers/login_controller.dart';

class AchievementsScreen extends StatelessWidget {
  final User? user;

  AchievementsScreen({super.key, required this.user});

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
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

                      String title = achievementData["title"];
                      String key = achievementData["key"];

                      title = key.tr ?? title;

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
                                    BadgeWidget(
                                      iconString: achievementData["icon"],
                                      id: achievementData["badge"],
                                    ),
                                    Column(
                                      children: title
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
    final loginController = Get.find<LoginController>();

    return ContainerWidget(
      color: Colors.blueGrey.shade800.withOpacity(.9),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "authenticate_cta_achivements".tr,
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () => loginController.signInWithGoogle(context),
            child: ContainerWidget(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Ionicons.logo_google,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "login_with_google".tr.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
