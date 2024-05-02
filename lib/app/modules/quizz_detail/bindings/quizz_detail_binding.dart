import 'package:get/get.dart';

import '../controllers/quizz_detail_controller.dart';

class QuizzDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizzDetailController>(
      () => QuizzDetailController(),
    );
  }
}
