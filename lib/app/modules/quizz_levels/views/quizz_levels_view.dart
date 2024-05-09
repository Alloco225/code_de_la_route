import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/title_widget.dart';
import '../controllers/quizz_levels_controller.dart';

class QuizzLevelsView extends GetView<QuizzLevelsController> {
  QuizzLevelsView({super.key});

  final quizzList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TitleWidget(title: "Quizz"),
            Expanded(
                child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Signalisation",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                      Text("0/15"),
                    ],
                  ),
                ),
                for (var i = 0; i < 2; i++) buildQuizzContainer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Degagement",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                      Text("0/15"),
                    ],
                  ),
                ),
                buildQuizzContainer()
              ],
            )),
            const BackNavButton(),
          ],
        ),
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
                  // color: Colors.white,
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
                            fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                      const Text(
                        "Note moyenne: 15/20",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
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
