import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:codedelaroute/app/views/ui/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helpers/utils.dart';
import '../../../views/widgets/container_widget.dart';
import '../../auth/services/auth_service.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final _authService = Get.find<AuthService>();
  final authController = Get.find<AuthController>();

  final VERSION = "2.6.1";

  final List menuElements = [
    {
      "text": "signs",
      "icon": Icons.directions_outlined,
      "route": Routes.PANNEAUX_CATEGORIES,
    },
    {
      "text": "quizz",
      "icon": Ionicons.help_outline,
      "route":
          //Routes.QUIZZ_CATEGORIES
          Routes.QUIZZ_LIST,
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
    // {
    //   "text": "settings",
    //   "icon": Ionicons.settings_outline,
    //   "route": Routes.SETTINGS,
    // },
    {
      "text": "profile",
      "icon": Ionicons.person_outline,
      "route": Routes.PROFILE,
    },
  ];

  final String _privacyURL = "https://amane.dev/privacy";
  final String _cguURL = "https://amane.dev/privacy";
  final String _authorURL = "https://amane.dev";

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      authController.updateUser(user);
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in! $user');
      }
    });

    void launchURL(String url) async {
      Uri uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        showSnackbarError("Could not launch $url", context: context);
        throw 'Could not launch $url';
      }
    }

    openCredits() {
      openModalBottomSheet(
        Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * .2,
            maxHeight: MediaQuery.of(context).size.height * .4,
          ),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade700,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 100,
                child: Image.asset('assets/images/favicon.png'),
              ),
              const Text(
                "Code de la Route",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Wrap(alignment: WrapAlignment.center, runSpacing: 10, children: [
                InkWell(
                  onTap: () => launchURL(_cguURL),
                  child: const Text(
                    "Conditions d'utilisation",
                    textAlign: TextAlign.center,
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                InkWell(
                  onTap: () => launchURL(_privacyURL),
                  child: const Text(
                    "Politique de confidentialité",
                    textAlign: TextAlign.center,
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ]),
              Text("Version $VERSION du 23/05/2024"),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Made by",
                  ),
                  const WidgetSpan(child: SizedBox(width: 5)),
                  WidgetSpan(
                    child: InkWell(
                      onTap: () => launchURL(_authorURL),
                      child: const Text(
                        "あ",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        context: context,
      );
    }

    return Scaffold(
        backgroundColor: Colors.blueGrey.shade700,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 45,
            ),
            InkWell(
              onTap: openCredits,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            ConstrainedBox(
                constraints:
                    const BoxConstraints(minHeight: 10, maxHeight: 45)),
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
                          child: ContainerWidget(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: SizedBox(
                              width: double.infinity,
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
                                    (element['text'] as String)
                                        .tr
                                        .toUpperCase(),
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
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            InkWell(
              onTap: openCredits,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "あ",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 22),
                        ),
                        Text(
                          "v$VERSION",
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 22),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
