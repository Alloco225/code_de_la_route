import 'package:codedelaroute/app/modules/quizz/sign_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/panneaux_controller.dart';

class PanneauxView extends GetView<PanneauxController> {
  const PanneauxView({super.key});

  showSignDetails(Sign sign) {
    // Open bottom drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          title: Obx(
            () => Text(
              "Les Panneaux ${controller.categoryName}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
          centerTitle: true,
        ),
        // Ressource attribution : https://www.vecteezy.com/members/seetwo
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(() => GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                children: controller.signs
                    .map(
                      (element) => InkWell(
                        onTap: () => showSignDetails(element),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset(element.image!),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(element.name ?? '--',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 23)),
                              ],
                            )),
                      ),
                    )
                    .toList(),
              )),
        ));
  }
}
