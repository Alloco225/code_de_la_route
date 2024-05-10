import 'dart:ffi';

import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../routes/app_pages.dart';
import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/title_widget.dart';
import '../controllers/panneaux_categories_controller.dart';

class PanneauxCategoriesView extends GetView<PanneauxCategoriesController> {
  const PanneauxCategoriesView({super.key});

  void gotoSignsList(SignCategory category) {
    Get.toNamed(Routes.PANNEAUX,
        arguments: {"categoryId": category.id, "categoryName": category.name});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Ressource attribution : https://www.vecteezy.com/members/seetwo
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          const TitleWidget(
            title: "Les Panneaux de Signalisation",
          ),
          Obx(
            () => controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed(Routes.PANNEAUX),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade800,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                          "assets/images/categories/lights.png"),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("TOUS",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 23)),
                                  ],
                                )),
                          ),
                          ...controller.categories.map(
                              (element) => _buildCategoryGridItem(element)),
                        ]),
                  ),
          ),
          const BackNavButton(),
        ],
      ),
    ));
  }

  _buildCategoryGridItem(SignCategory element) {
    return InkWell(
      onTap: () => gotoSignsList(element),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
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
              Text(element.name ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 23)),
            ],
          )),
    );
  }
}
