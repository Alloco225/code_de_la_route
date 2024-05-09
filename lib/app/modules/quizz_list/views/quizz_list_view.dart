import 'dart:developer';

import 'package:codedelaroute/app/data/extensions.dart';
import 'package:codedelaroute/app/data/models/quizz_model.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/title_widget.dart';
import '../controllers/quizz_list_controller.dart';

class QuizzListView extends GetView<QuizzListController> {
  const QuizzListView({super.key});

  gotoQuizz({categoryId, quizzId}) {
    log("gotoQuizz $quizzId");
    debugPrint("gotoQuizz $quizzId");
    Get.toNamed(Routes.QUIZZ_DETAIL,
        arguments: {'categoryId': categoryId, 'quizzId': quizzId});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                          List values = entry.value;
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
                                    Text("0/${values.length}"),
                                  ],
                                ),
                              ),
                              Column(
                                children: values.map((value) {
                                  return buildQuizzContainer();
                                }).toList(),
                              ),
                            ],
                          );
                        }),
              ),
              const BackNavButton(),
            ])),
      ),
    );
  }

  SizedBox buildQuizzContainer() {
    return SizedBox(
        height: 100,
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
                  decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white))),
                  child: Image.asset(
                      'assets/images/signalisation/585f8f29cb11b227491c3555.png'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quizz 1",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Note moyenne: 15/20",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: .5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.orange,
                              ),
                              height: 4,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
