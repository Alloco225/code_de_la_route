import 'package:cdlr/db/db.dart';
import 'package:cdlr/helpers/assets.dart';
import 'package:cdlr/state_providers/game_state_provider.dart';
import 'package:cdlr/widgets/question_image_widget.dart';
import 'package:cdlr/widgets/question_timer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';
import '../data/models/question.dart';
import '../routes.dart';

class QuizzDetailScreen extends StatefulWidget {
  const QuizzDetailScreen({super.key});

  @override
  State<QuizzDetailScreen> createState() => _QuizzDetailScreenState();
}

class _QuizzDetailScreenState extends State<QuizzDetailScreen> {
  late Quizz quizz;

  late String categoryId;

  late int quizzId;

  int currentQuestionIndex = 0;

  bool showCorrectAnswer = false;

  List<Question> get questions => quizz.questions;

  Question get currentQuestion => questions[currentQuestionIndex];

  Widget get getQuestionWidget {
    if (currentQuestion.type == "image") {
      return QuestionImageWidget(
          question: currentQuestion, showCorrectAnswer: showCorrectAnswer);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    var gameState = Provider.of<GameStateProvider>(context);

    startQuizz() {
      currentQuestionIndex = 0;
    }

    initPage() {
      Map? params = ModalRoute.of(context)?.settings.arguments as Map?;

      categoryId = params?['categoryId'];
      quizzId = params?['quizzId'];

      quizz = QUIZZES
          .firstWhere((el) => el.categoryId == categoryId && el.id == quizzId);
    }

    // final quizzState = mainRef.watch(quizzStateProvider);

    initPage();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Question ${currentQuestionIndex + 1}/${questions.length}",
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  // const QuestionTimerWidget(),
                  InkWell(
                    onTap: () => gameState.togglePause(),
                    child: Text(gameState.isPaused ? "Paused" : "Play"),
                  ),
                  Expanded(child: getQuestionWidget),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
