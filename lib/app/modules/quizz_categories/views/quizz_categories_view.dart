import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/quizz_category_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/quizz_categories_controller.dart';

class QuizzCategoriesView extends GetView<QuizzCategoriesController> {

  const QuizzCategoriesView({super.key});

  void gotoQuizzList(QuizzCategory category) {
    Get.toNamed(Routes.QUIZZ_LIST,
        arguments: {"categoryId": category.id, "categoryName": category.name});

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizzCategoriesView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / .9,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    children: controller.categories
                        .map((category) => InkWell(
                            onTap: () => gotoQuizzList(category),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: category.image != null ? DecorationImage(
                                    image: AssetImage(category.image!),
                                    fit: BoxFit.cover,
                                  ) : null,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white)),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                      child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black38,
                                              Colors.black87,
                                            ])),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category.name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )))
                        .toList(),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
