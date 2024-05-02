import 'package:get/get.dart';

import '../controllers/quizz_categories_controller.dart';

class QuizzCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizzCategoriesController>(
      () => QuizzCategoriesController(),
    );
  }
}
