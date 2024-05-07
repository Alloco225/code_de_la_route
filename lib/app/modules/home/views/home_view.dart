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
      "action": () {
        Get.toNamed(Routes.PANNEAUX_CATEGORIES);
      },
    },
    {
      "text": "QUIZZ",
      "action": () {
        Get.toNamed(Routes.QUIZZ_CATEGORIES);
      },
    },
    {
      "text": "PROFILE",
      "action": () {
        Get.toNamed(Routes.PROFILE);
      },
    },
    {
      "text": "LEADERBOARD",
      "action": () {
        Get.toNamed(Routes.LEADERBOARD);
      },
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
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.directions,
                                size: 32,
                              ),
                              Text(
                                "Panneaux",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            children: [
                              Icon(
                                Ionicons.help_outline,
                                size: 32,
                              ),
                              Text(
                                "Quizz",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            children: [
                              Icon(
                                Ionicons.settings_outline,
                                size: 32,
                              ),
                              Text(
                                "Réglages",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // ...menuElements.map(
                        //   (element) => Column(children: [
                        //     MenuButtonWidget(
                        //       text: element['text'],
                        //       onPressed: element['action'],
                        //     ),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //   ]),
                        // ),
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
