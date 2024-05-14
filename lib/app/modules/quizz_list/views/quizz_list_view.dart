import 'dart:developer';

import 'package:codedelaroute/app/data/extensions.dart';
import 'package:codedelaroute/app/data/models/quizz_model.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:codedelaroute/app/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../helpers/utils.dart';
import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/title_widget.dart';
import '../controllers/quizz_list_controller.dart';

class QuizzListView extends StatefulWidget {
  const QuizzListView({super.key});

  @override
  State<QuizzListView> createState() => _QuizzListViewState();
}

class _QuizzListViewState extends State<QuizzListView> {
  final controller = Get.find<QuizzListController>();
  final storage = GetStorage();

  gotoQuizz({categoryId, quizzId}) {
    log("gotoQuizz $categoryId $quizzId");
    Get.toNamed(
            // Routes.QUIZZ_DETAIL,
            Routes.QUIZZ_GAME,
            arguments: {'categoryId': categoryId, 'quizzId': quizzId})
        ?.then((value) => setState(() {}));
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
                    ? LoadingWidget()
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
                                    // Text(
                                    //   "0/${values.length}",
                                    //   style: const TextStyle(
                                    //     fontWeight: FontWeight.w400,
                                    //     fontSize: 23,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Column(children: [
                                for (var i = 0; i < values.length; i++)
                                  buildQuizzContainer(
                                      title: values[i].name ?? 'Quizz ${i + 1}',
                                      // completionPercentage: 0,
                                      image: values[i].image,
                                      storage: storage,
                                      // score: values[i].score,
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

  Widget buildQuizzContainer({
    required quizzId,
    required String title,
    required storage,
    // double? score,
    String? image,
    // double completionPercentage = .3,
    required VoidCallback onTap,
  }) {
    double? score = storage.read(quizzId);
    double percentage = (((score ?? 0)) / 20);

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
                if (image != null)
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.horizontal(left: Radius.circular(8)),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          border:
                              Border(right: BorderSide(color: Colors.white))),
                      child: Image.asset(image, width: 100),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (score != null)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Note",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "${(score ?? 0).toInt()}/20",
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              if (score == null) ...[
                                const Text(
                                  "Pas encore noté",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(2),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FractionallySizedBox(
                                    widthFactor: percentage,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: percentageColor(percentage),
                                      ),
                                      height: 8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
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
