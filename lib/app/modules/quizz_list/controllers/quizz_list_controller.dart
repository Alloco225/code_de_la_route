import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/db/db_data.dart';
import '../../../data/models/quizz_model.dart';

class QuizzListController extends GetxController {
  //TODO: Implement QuizzListController

  final count = 0.obs;
  final isLoading = false.obs;

  final quizzes = <Quizz>[...QUIZZES].obs;

  // get quizzes => _quizzes.value;

  @override
  void onInit() {
    super.onInit();
    Map? params = Get.arguments as Map?;

    var categoryId = params?['categoryId'];

    // selectedCategory = CATEGORIES.firstWhere((el) => el.id == categoryId);
    quizzes.value = QUIZZES.where((el) => el.categoryId == categoryId).toList();
    if (kDebugMode) {
      print("QuizzList onInit");
    }
  }

  @override
  void onReady() {
    super.onReady();
    print("QuizzList onReady");
  }

  @override
  void onClose() {
    super.onClose();
    print("QuizzList onClose");
  }

  void increment() => count.value++;
}
