import 'package:get/get.dart';

import '../controllers/quizz_list_controller.dart';

class QuizzListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizzListController>(
      () => QuizzListController(),
    );
  }
}
