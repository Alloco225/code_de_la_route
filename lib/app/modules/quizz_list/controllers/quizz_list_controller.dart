import 'dart:developer';

import 'package:codedelaroute/app/data/models/answer_model.dart';
import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '../../../data/models/question_model.dart';
import '../../../data/models/quizz_model.dart';
import '../../../data/models/sign_model.dart';
import '../../../data/providers/sign_category_provider.dart';
import '../../../data/providers/sign_provider.dart';

class QuizzListController extends GetxController {
  final _isLoading = true.obs;

  final _quizzList = <Quizz>[].obs;
  final _quizzes = <Quizz>[].obs;
  // final _quizzList = <Quizz>[...QUIZZES].obs;

  List<Quizz> get quizzes => _quizzes.value;
  bool get isLoading => _isLoading.value;

  final _groupedQuizzes = <String, List<Quizz>>{}.obs;

  Map<String, List<Quizz>> get groupedQuizzes => _groupedQuizzes.value;

  @override
  void onReady() async {
    super.onReady();
    _isLoading.value = true;
    // _quizzList.value = await QuizzesProvider().loadAllQuizzes();
    _quizzList.value = await loadQuizzesFromSignCategories();

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

  loadQuizzesFromSignCategories() async {
    log("loadQuizzesFromSignCategories");
    final signCategoryProvider = SignCategoryProvider();
    final signProvider = SignProvider();

    List<SignCategory> categories =
        await signCategoryProvider.loadSignCategory();

    List<Quizz> quizzes = [];
    for (var catIndex = 0; catIndex < categories.length; catIndex++) {
      SignCategory category = categories[catIndex];

      List<Sign> signs =
          await signProvider.loadSignByCategory('signs_${category.id}');

      const maxQuestionsPerQuizz = 10;

      int quizzCount = signs.length ~/ maxQuestionsPerQuizz;

      for (var quizzIdx = 0; quizzIdx < quizzCount; quizzIdx++) {
        // signs.shuffle();
        signs.slice(quizzIdx * maxQuestionsPerQuizz,
            (quizzIdx + 1) * maxQuestionsPerQuizz);
        //
        List<Question> questions = [];
        int maxQuestions = 10;
        for (var i = 0; i < maxQuestions; i++) {
          var sign = signs[i];

          List<Answer> answers = [];

          answers.add(Answer(
            content: sign.name,
            isCorrect: true,
          ));
          // And other false answers
          const falseAnswerCount = 3;
          if (i >= signs.length - falseAnswerCount) {
            for (var j = i - 1; j >= i - falseAnswerCount; j--) {
              answers.add(Answer(content: signs[j].name));
            }
          } else {
            for (var j = i + 1; j <= i + falseAnswerCount; j++) {
              answers.add(Answer(content: signs[j].name));
            }
          }
          // randomize the bih
          answers.shuffle();

          // Add fake answers
          questions.add(Question(
            categoryId: category.id,
            prompt: "De quel panneau s'agit-il ?",
            level: sign.level,
            type: "image",
            image: sign.imageUrl,
            answers: answers,
          ));
        }

        //
        quizzes.add(Quizz(
          id: "q_${category.id}_$catIndex",
          categoryId: category.id,
          name: null,
          image: category.image,
          questions: questions,
        ));
      }
    }
    return quizzes;
  }

  @override
  void onClose() {
    super.onClose();
    print("QuizzList onClose");
  }
}
