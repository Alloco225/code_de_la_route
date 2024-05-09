import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../data/models/sign_model.dart';
import '../controllers/panneaux_controller.dart';

class PanneauxView extends GetView<PanneauxController> {
  const PanneauxView({super.key});

  showSignDetails(Sign sign) {
    // Open bottom drawer
  }

  @override
  Widget build(BuildContext context) {
    var obx = Obx(() => controller.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 120,
                              child: Image.asset(element.image!.isNotEmpty
                                  ? element.image!
                                  : "assets/images/categories/${element.categoryId}.png"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              element.name ?? '--',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 20),
                            )
                          ],
                        )),
                  ),
                )
                .toList(),
          ));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          title: Obx(
            () => Text(
              controller.categoryName == null
                  ? "Tous les panneaux"
                  : "Les Panneaux ${controller.categoryName}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
          centerTitle: true,
        ),
        // Ressource attribution : https://www.vecteezy.com/members/seetwo
        body: Padding(
          padding: const EdgeInsets.all(10),
          // child: obx,
          child: Obx(() => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(children: [
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    axisDirection: AxisDirection.down,
                    children: controller.signs
                        .map((element) => StaggeredGridTile.fit(
                              crossAxisCellCount: 1,
                              child: InkWell(
                                onTap: () => showSignDetails(element),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.white,
                                        )),
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 120,
                                          child: Image.asset(element
                                                  .image!.isNotEmpty
                                              ? element.image!
                                              : "assets/images/categories/${element.categoryId}.png"),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          element.name ?? '--',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      ],
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                ])),
        ));
  }
}
