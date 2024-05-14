// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

import 'package:codedelaroute/app/data/models/answer_model.dart';
import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/question_model.dart';
import '../../../data/models/quizz_model.dart';
import '../../../data/models/sign_model.dart';
import '../../../data/providers/sign_category_provider.dart';
import '../../../data/providers/sign_provider.dart';

class QuizzListController extends GetxController {
  final _isLoading = true.obs;

  final storage = GetStorage();

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

    _groupedQuizzes.value =
        groupBy(_quizzes.value, (element) => element.categoryId!);

    await Future.delayed(const Duration(seconds: 1));
    _isLoading.value = false;
  }

  loadQuizzesFromSignCategories() async {
    final signCategoryProvider = SignCategoryProvider();
    final signProvider = SignProvider();

    List<SignCategory> categories =
        await signCategoryProvider.loadSignCategory();

    List<Quizz> quizzes = [];
    for (var catIndex = 0; catIndex < categories.length; catIndex++) {
      SignCategory category = categories[catIndex];

      String quizzImage = category.image!;

      List<Sign> signs =
          await signProvider.loadSignByCategory('signs_${category.id}');

      int questionsPerQuizz = 10;
      int answersPerQuestion = 4;
      List<Question> questions = [];
      List<Answer> answers = [];
      for (int i = 0; i < signs.length; i += 1) {
        var sign = signs[i];

        answers.add(Answer(
          content: sign.name,
          isCorrect: true,
        ));
        // And other false answers
        int falseAnswerCount = answersPerQuestion - 1;
        if (i >= signs.length - falseAnswerCount) {
          for (var j = i - 1; j >= i - falseAnswerCount; j--) {
            answers.add(Answer(content: signs[j].name));
          }
        } else {
          for (var j = i + 1; j <= i + falseAnswerCount; j++) {
            answers.add(Answer(content: signs[j].name));
          }
        }
        // confuuuse the ennemy

        if (answers.length == answersPerQuestion) {
          answers.shuffle();
          // Add fake answers

          if (Random().nextDouble() > .2) {
            quizzImage = sign.imageUrl;
          }

          questions.add(Question(
            categoryId: category.id,
            prompt: "De quel panneau s'agit-il ?",
            level: sign.level,
            type: "image",
            image: sign.imageUrl,
            answers: answers,
          ));
          answers = [];
        }

        if (questions.length == questionsPerQuizz || i == signs.length - 1) {
          String quizzId = "q_${category.id}_${quizzes.length}";
          double? score = storage.read(quizzId);

          questions.shuffle();
          quizzes.add(Quizz(
            id: quizzId,
            score: score,
            categoryId: category.id,
            name: null,
            image: quizzImage,
            questions: questions,
          ));
          questions = [];
          answers = [];
        }
      }
    }
    return quizzes;
  }
}
