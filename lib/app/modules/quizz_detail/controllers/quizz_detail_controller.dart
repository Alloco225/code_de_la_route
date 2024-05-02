import 'package:code_de_la_route/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/db/db.dart';
import '../../../data/models/quizz_model.dart';

class QuizzDetailController extends GetxController {
  Rx<Quizz?> quizz = null.obs;

  var categoryId = "".obs;

  var quizzId = 0.obs;
  Map? routeParams;

  // List<Question> get questions => quizz.questions;
  bool isLoading = true;
  @override
  void onInit() {
    super.onInit();

    var routeParams = Get.arguments as Map?;

    categoryId.value = routeParams?['categoryId'];
    quizzId.value = routeParams?['quizzId'];

    quizz.value = QUIZZES.firstWhere(
        (el) => el.categoryId == categoryId.value && el.id == quizzId.value);

    isLoading = false;

    Get.toNamed(
      Routes.QUIZZ_GAME, arguments: routeParams
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // *** GAME STATE CONTROLLER
}
