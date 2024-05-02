import 'package:get/get.dart';

import '../controllers/quizz_game_controller.dart';

class QuizzGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizzGameController>(
      () => QuizzGameController(),
    );
  }
}
