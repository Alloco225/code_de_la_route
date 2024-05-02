import 'package:code_de_la_route/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../views/widgets/menu_button_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Spacer(),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .2),
              child: Column(
                children: [
                  MenuButtonWidget(
                    text: "QUIZZ",
                    onPressed: () {
                      Get.toNamed(Routes.QUIZZ_CATEGORIES);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MenuButtonWidget(
                    text: "COURS",
                    onPressed: () {},
                  ),
                  MenuButtonWidget(
                    text: "ABD DMk smdl qsd",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // authStateProvider.authenticate();
                          // Navigator.of(context).pushNamed(Routes.auth);
                        },
                        icon: const Icon(Ionicons.person_outline),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Ionicons.settings_outline),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ));
  }
}
