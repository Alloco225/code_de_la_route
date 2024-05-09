import 'package:codedelaroute/app/data/models/quizz_category_model.dart';
import 'package:get/get.dart';

import '../../../data/db/db_data.dart';

class QuizzCategoriesController extends GetxController {
  //TODO: Implement QuizzCategoriesController

  final count = 0.obs;
  final categories = <QuizzCategory>[...CATEGORIES].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
