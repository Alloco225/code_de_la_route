import 'package:code_de_la_route/app/data/db/db.dart';
import 'package:get/get.dart';

import '../../../data/models/quizz_model.dart';

class QuizzListController extends GetxController {
  //TODO: Implement QuizzListController

  final count = 0.obs;
  final isLoading = false.obs;

  // final quizzes = <Quizz>[].obs;
  final quizzes = <Quizz>[...QUIZZES].obs;

  // get quizzes => _quizzes.value;

  void increment() => count.value++;
}
