import 'dart:developer';

import 'package:codedelaroute/app/helpers/utils.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/db/db_data.dart';
import '../../../data/models/quizz_model.dart';

class QuizzDetailController extends GetxController {
  final _quizz = (null as Quizz?).obs;

  Quizz? get quizz => _quizz.value;

  String? categoryId;

  int? quizzId;
  Map? routeParams;

  // List<Question> get questions => quizz.questions;
  bool isLoading = true;
  @override
  void onInit() {
    super.onInit();

    routeParams = Get.arguments as Map?;

    categoryId = routeParams?['categoryId'];
    quizzId = routeParams?['quizzId'];

    _quizz.value = QUIZZES.firstWhereOrNull(
        (el) => el.categoryId == categoryId && el.id == quizzId);

    isLoading = false;
    print("DetailController onInit");
    log("DetailController onInit");

    if (kDebugMode) {
      print("DetailController DetailController onInit");
    }
  }

  @override
  void onReady() {
    super.onReady();
    print("DetailController DetailController onReady onReady");

    print("DetailController onReady");

    log("DetailController onReady $routeParams");
    Get.toNamed(Routes.QUIZZ_GAME, arguments: routeParams);
  }

  // *** GAME STATE CONTROLLER
}
