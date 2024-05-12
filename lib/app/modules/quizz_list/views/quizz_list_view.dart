import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codedelaroute/app/data/extensions.dart';
import 'package:codedelaroute/app/data/models/quizz_model.dart';
import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/title_widget.dart';
import '../controllers/quizz_list_controller.dart';
import 'quizz_score_widget.dart';

class QuizzListView extends GetView<QuizzListController> {
  const QuizzListView({super.key});

  gotoQuizz({categoryId, quizzId}) {
    log("gotoQuizz $quizzId");
    debugPrint("gotoQuizz $quizzId");
    Get.toNamed(
        // Routes.QUIZZ_DETAIL,
        Routes.QUIZZ_GAME,
        arguments: {'categoryId': categoryId, 'quizzId': quizzId});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Obx(() =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const TitleWidget(title: "Quizz"),
              Expanded(
                child: controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.groupedQuizzes.entries.length,
                        itemBuilder: (ctx, i) {
                          var entry =
                              controller.groupedQuizzes.entries.toList()[i];
                          String key = entry.key;
                          List<Quizz> values = entry.value;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      key.toCapitalized(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "0/${values.length}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 23,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(children: [
                                for (var i = 0; i < values.length; i++)
                                  buildQuizzContainer(
                                      title: values[i].name ?? 'Quizz ${i + 1}',
                                      completionPercentage: 0,
                                      score: null,
                                      quizzId: values[i].id,
                                      onTap: () => gotoQuizz(
                                            quizzId: values[i].id,
                                            categoryId: values[i].categoryId,
                                          ))
                              ]),
                            ],
                          );
                        }),
              ),
              const BackNavButton(),
            ])),
      ),
    );
  }

  buildQuizzContainer({
    required quizzId,
    required String title,
    String? score,
    double completionPercentage = .3,
    required VoidCallback onTap,
  }) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 110, maxHeight: 120),
        child: InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade800,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(8)),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.white))),
                    child: Image.asset(
                      'assets/images/signalisation/585f8f29cb11b227491c3555.png',
                      width: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                        QuizScoresWidget(quizzId),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  // Widget showScore(quizzId) {
  //   final _authController = Get.find<AuthController>();

  //   if (_authController.isAuth) {
  //     return FutureBuilder<DocumentSnapshot>(
  //       future: FirebaseFirestore.instance
  //           .collection('user_scores')
  //           .where('quizz_id', isEqualTo: quizzId)
  //           .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //           .get(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Text('Loading...');
  //         }
  //         if (snapshot.hasData &&
  //             snapshot.data!.exists &&
  //             (snapshot.data! as Map).containsKey('score')) {
  //           return Text('Your score: ${snapshot.data!['score']}');
  //         } else {
  //           return Text('Not attempted');
  //         }
  //       },
  //     );
  //   }
  //   return Container();
  // }
}
