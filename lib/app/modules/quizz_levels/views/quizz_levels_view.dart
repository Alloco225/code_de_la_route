import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/quizz_levels_controller.dart';

class QuizzLevelsView extends GetView<QuizzLevelsController> {
  QuizzLevelsView({super.key});

  final quizzList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        // title: const Text(
        //   'QuizzLevelsView',
        //   style: TextStyle(color: Colors.white),
        // ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: PageView(
                children: [
                  Container(
                    child: const Text("Signalisation"),
                  )
                ],
              ),
            ),
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
                for (var i = 0; i < 10; i++) buildQuizzContainer(),
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
          ],
        ),
      ),
    );
  }

  SizedBox buildQuizzContainer() {
    return SizedBox(
        height: 100,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(8)),
                child: Container(
                  color: Colors.white,
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
                                color: Colors.blue,
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
