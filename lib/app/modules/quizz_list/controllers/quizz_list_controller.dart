import 'dart:developer';

import 'package:codedelaroute/app/modules/quizz_list/providers/quizzes_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/db/db_data.dart';
import '../../../data/models/quizz_model.dart';

class QuizzListController extends GetxController {
  //TODO: Implement QuizzListController

  final _isLoading = true.obs;

  final _quizzList = <Quizz>[].obs;
  final _quizzes = <Quizz>[].obs;
  // final _quizzList = <Quizz>[...QUIZZES].obs;

  get quizzes => _quizzes.value;
  bool get isLoading => _isLoading.value;

  final _groupedQuizzes = <String, List<Quizz>>{}.obs;

  Map<String, List<Quizz>> get groupedQuizzes => _groupedQuizzes.value;

  @override
  void onReady() async {
    super.onReady();
    _isLoading.value = true;
    _quizzList.value = await QuizzesProvider().loadAllQuizzes();

    _quizzes.value = _quizzList.value;
    try {
      Map? params = Get.arguments as Map?;
      var categoryId = params?['categoryId'];

      _quizzes.value = _quizzList.value;
    } catch (e) {}

    // var quizzesJson = await QuizzesProvider().loadAllQuizzesJson();
    // _groupedQuizzes.value =
    //     groupBy(quizzesJson, (element) => element['categoryId']);
    _groupedQuizzes.value =
        groupBy(_quizzes.value, (element) => element.categoryId!);

    _isLoading.value = false;
    // selectedCategory = CATEGORIES.firstWhere((el) => el.id == categoryId);
    // quizzes.value = QUIZZES.where((el) => el.categoryId == categoryId).toList();
    print("QuizzList onInit ");
    // log("QuizzList onInit ${quizzesJson.length}");
    print("QuizzList onReady");
  }

  @override
  void onClose() {
    super.onClose();
    print("QuizzList onClose");
  }
}
