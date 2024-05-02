import 'package:get/get.dart';

import '../controllers/quizz_controller.dart';

class QuizzBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizzController>(
      () => QuizzController(),
    );
  }
}
