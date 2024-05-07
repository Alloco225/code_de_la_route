import 'package:get/get.dart';

import '../controllers/quizz_levels_controller.dart';

class QuizzLevelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizzLevelsController>(
      () => QuizzLevelsController(),
    );
  }
}
