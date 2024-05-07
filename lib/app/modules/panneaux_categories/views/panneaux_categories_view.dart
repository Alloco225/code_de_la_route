import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/panneaux_categories_controller.dart';

class PanneauxCategoriesView extends GetView<PanneauxCategoriesController> {
  PanneauxCategoriesView({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      "title": "OBLIGATION",
      "image": "assets/images/signalisation/585f9250cb11b227491c357d.png",
      "route": Routes.PANNEAUX,
    },
    {
      "title": "DANGER",
      "image": "assets/images/signalisation/585f900ecb11b227491c356e.png",
      "route": Routes.PANNEAUX,
    },
    {
      "title": "INTERDICTION",
      "image": "assets/images/signalisation/585f900ecb11b227491c356e.png",
      "route": Routes.PANNEAUX,
    },
    {
      "title": "INDICATION",
      "image": "assets/images/signalisation/585f900ecb11b227491c356e.png",
      "route": Routes.PANNEAUX,
    },
    {
      "title": "PARKING",
      "image": "assets/images/signalisation/585f900ecb11b227491c356e.png",
      "route": Routes.PANNEAUX,
    },
    {
      "title": "TEMPORAIRE",
      "image": "assets/images/signalisation/585f900ecb11b227491c356e.png",
      "route": Routes.PANNEAUX,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade700,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          title: const Text(
            'Les Panneaux de Signalisation',
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
          ),
          centerTitle: true,
        ),
        // Ressource attribution : https://www.vecteezy.com/members/seetwo
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            children: categories
                .map(
                  (element) => InkWell(
                    onTap: () => Get.toNamed(element['route']),
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
                              child: Image.asset(element['image']),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(element['title'],
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
          ),
        ));
  }
}
