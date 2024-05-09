import 'package:codedelaroute/app/const/theme.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../auth/services/auth_service.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final _authService = Get.find<AuthService>();

  final List menuElements = [
    {
      "text": "PANNEAUX",
      "icon": Icons.directions_outlined,
      "route": Routes.PANNEAUX_CATEGORIES,
    },
    {
      "text": "QUIZZ",
      "icon": Ionicons.help_outline,
      "route":
          //Routes.QUIZZ_CATEGORIES
          Routes.QUIZZ_LEVELS,
    },
    // {
    //   "text": "PROFILE",
    //   "route":
    //    Routes.PROFILE
    //   ,
    // },
    // {
    //   "text": "LEADERBOARD",
    //   "route":
    //    Routes.LEADERBOARD
    //   ,
    // },
    {
      "text": "SETTINGS",
      "icon": Ionicons.settings_outline,
      "route": Routes.SETTINGS,
    },
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    return Scaffold(
        backgroundColor: Colors.blueGrey.shade700,
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .2),
                    child: Column(
                      children: [
                        ...menuElements.map(
                          (element) => Column(
                            children: [
                              InkWell(
                                onTap: () => Get.toNamed(element['route']),
                                splashColor: Colors.blueGrey.shade100,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.blueGrey.shade800,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    children: [
                                      Icon(
                                        element['icon'],
                                        size: 32,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        element['text'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "v2.0.3",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 22),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              child: Container(),
            ),
          ],
        ));
  }
}
