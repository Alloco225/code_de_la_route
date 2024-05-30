import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/providers/sign_provider.dart';
import '../../../data/services/firestore_service.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../quizz_list/controllers/quizz_list_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final authController = AuthController();
  final _signProvider = SignProvider();
  final _quizzListController = Get.find<QuizzListController>();
  final _totalSignCount = 0.obs;
  final _totalQuizzCount = 0.obs;
  final _avgScore = 0.0.obs;

  final _learnedSignCount = 0.obs;
  final _acedQuizzCount = 0.obs;

  bool get isAuth => authController.isAuth;

  int get totalSignCount => _totalSignCount.value;
  int get totalQuizzCount => _totalQuizzCount.value;
  double get avgScore => _avgScore.value;
  int get learnedSignCount => _learnedSignCount.value;
  int get acedQuizzCount => _acedQuizzCount.value;

  final count = 0.obs;

  void increment() => count.value++;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    _signProvider
        .loadAllSigns()
        .then((list) => _totalSignCount.value = list.length);

    _totalQuizzCount.value = _quizzListController.quizzList.length;
    calculateStats();
  }

  calculateStats() async {
    log("calculating stats");
    // _avgScore.value = _quizzListController.quizzList
    //         .map((e) => e.score)
    //         .reduce((value, element) => value! + element!)! ~/
    //     _quizzListController.quizzList.length;

    if (authController.userId != null) {
      FirestoreService firestoreService =
          FirestoreService(authController.userId!);
      _avgScore.value = await firestoreService.calculateAverageScore();

      _acedQuizzCount.value = await firestoreService.countFullMarksQuizzes();
      log("Aced Quizz Count: $_acedQuizzCount");
    }
  }
}
