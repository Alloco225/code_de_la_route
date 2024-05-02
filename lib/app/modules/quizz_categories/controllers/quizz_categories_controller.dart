import 'package:code_de_la_route/app/data/db/db.dart';
import 'package:code_de_la_route/app/data/models/quizz_category_model.dart';
import 'package:get/get.dart';

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
