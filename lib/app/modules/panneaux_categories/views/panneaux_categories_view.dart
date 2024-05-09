import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
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
        appBar: AppBar(
          title: const Text(
            'Les Panneaux de Signalisation',
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
          ),
          centerTitle: true,
        ),
        // Ressource attribution : https://www.vecteezy.com/members/seetwo
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    children: controller.categories
                        .map(
                          (element) => InkWell(
                            onTap: () => gotoSignsList(element),
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
                                    Text(element.name ?? '',
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
          ),
        ));
  }
}
