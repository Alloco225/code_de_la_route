import 'package:cdlr/db/db.dart';
import 'package:cdlr/state_providers/game_state_provider.dart';
import 'package:cdlr/widgets/question_image_widget.dart';
import 'package:cdlr/widgets/question_timer_widget.dart';
import 'package:cdlr/widgets/quizz_ended_widget.dart';
import 'package:cdlr/widgets/quizz_paused_widget.dart';
import 'package:cdlr/widgets/tu_veux_abandonner_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';
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
  late Map? routeParams;
  late GameStateProvider gameState;

  List<Question> get questions => quizz.questions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initPage();
  }

  initPage() {
    routeParams = ModalRoute.of(context)?.settings.arguments as Map?;

    categoryId = routeParams?['categoryId'];
    quizzId = routeParams?['quizzId'];

    quizz = QUIZZES
        .firstWhere((el) => el.categoryId == categoryId && el.id == quizzId);

    gameState = Provider.of<GameStateProvider>(context);

    gameState.selectQuizz(quizz);
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[gameState.currentQuestionIndex];

    Widget getQuestionWidget() {
      if (currentQuestion.type == "image") {
        return QuestionImageWidget(
          question: currentQuestion,
          isCorrectAnswerVisible: gameState.isCorrectAnswerVisible,
          onSelectAnswer: gameState.doubleTapAnswerToSubmit,
          selectedAnswer: gameState.selectedAnswer,
        );
      }
      return Container();
    }

    gotoHome() {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }

    gotoQuizzList() {
      Navigator.of(context).pushReplacementNamed(Routes.quizzList,
          arguments: {categoryId: routeParams?['categoryId']});
    }

    // final quizzState = mainRef.watch(quizzStateProvider);

    return Scaffold(
      body: Stack(
        children: [
          GameMainContentWidget(
              currentQuestionIndex: gameState.currentQuestionIndex,
              questions: questions,
              gameState: gameState,
              getQuestionWidget: getQuestionWidget()),
          if (gameState.isPaused)
            QuizzPausedWidget(
                onResume: gameState.onGameResume, onQuit: gameState.onQuit),
          if (gameState.isQuitting)
            TuVeuxAbandonnerWidget(
              onClose: gameState.clearUserQuitting,
            ),
          // Game
          if (gameState.hasGameEnded)
            QuizzEnded(
              correctAnswerCount: 20,
              questionCount: 20,
              onGoHome: gotoHome,
              onRestartQuizz: gameState.onRestartQuizz,
              onReturnToQuizzList: gotoQuizzList,
            ),
        ],
      ),
    );
  }
}

class GameMainContentWidget extends StatelessWidget {
  const GameMainContentWidget({
    super.key,
    required this.currentQuestionIndex,
    required this.questions,
    required GameStateProvider gameState,
    required this.getQuestionWidget,
  }) : _gameState = gameState;

  final int currentQuestionIndex;
  final List<Question> questions;
  final GameStateProvider _gameState;
  final Widget getQuestionWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                QuestionTimerWidget(
                  time: _gameState.time,
                  percentage: _gameState.percentage,
                  onInit: _gameState.startTimer,
                  onDispose: _gameState.stopTimer,
                  onTimeExpired: _gameState.onTimeExpired,
                  onTogglePause: _gameState.onTogglePause,
                  pause: _gameState.isPaused,
                ),
                Expanded(child: getQuestionWidget),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
