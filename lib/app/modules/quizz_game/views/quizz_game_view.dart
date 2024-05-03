import 'package:code_de_la_route/app/modules/quizz_game/views/quizz_game_main_content_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../views/widgets/question_image_widget.dart';
import '../../../views/widgets/question_order_widget.dart';
import '../../quizz_game/views/quizz_ended_view.dart';
import '../../quizz_game/views/quizz_paused_view.dart';
import '../../quizz_game/views/tu_veux_abandonner_view.dart';
import '../controllers/quizz_game_controller.dart';

class QuizzGameView extends GetView<QuizzGameController> {
  const QuizzGameView({super.key});

  gotoHome() {
    Get.toNamed(Routes.WELCOME);
  }

  gotoQuizzList() {
    controller.clearQuizz();
    Get.back();

    // Navigator.of(context).pushReplacementNamed(Routes.quizzList,
    //     arguments: {categoryId: routeParams?['categoryId']});
  }

  Widget getQuestionWidget() {
    if (controller.currentQuestion == null) {
      return Container();
    }

    if (controller.currentQuestion!.type == "image") {
      return QuestionImageWidget(
        question: controller.currentQuestion!,
        isCorrectAnswerVisible: controller.isCorrectAnswerVisible,
        onSelectAnswer: controller.doubleTapAnswerToSubmit,
        selectedAnswer: controller.selectedAnswer,
      );
    }
    if (controller.currentQuestion!.type == "order") {
      return QuestionOrderWidget(
        question: controller.currentQuestion!,
        isCorrectAnswerVisible: controller.isCorrectAnswerVisible,
        onSelectAnswer: controller.doubleTapAnswerToSubmit,
        selectedAnswer: controller.selectedAnswer,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        // TODO add tu veux abandonner
        print("Oh Ho! Il veut abandonner");
        // Navigator.pop(context, false);
        // return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(result: Get.arguments),
            icon: const BackButtonIcon(),
          ),
          title: const Text('QuizzGameView'),
          centerTitle: true,
        ),
        body: Obx(
          () => Stack(
            children: [
              if (controller.isLoading)
                const Center(child: CircularProgressIndicator())
              else if (controller.quizzNotFound)
                Container(
                  child: const Text("No"),
                )
              else
                QuizzGameMainContentView(
                    currentQuestionIndex: controller.currentQuestionIndex,
                    questions: controller.questions,
                    time: controller.time,
                    percentage: controller.percentage,
                    startTimer: controller.startTimer,
                    stopTimer: controller.stopTimer,
                    onTimeExpired: controller.onTimeExpired,
                    onTogglePause: controller.onTogglePause,
                    togglePauseTimer: controller.togglePauseTimer,
                    isPaused: controller.isPaused,
                    getQuestionWidget: getQuestionWidget()),
              if (controller.isPaused)
                QuizzPausedView(
                    onResume: controller.onGameResume,
                    onQuit: controller.onQuit),
              if (controller.isQuitting)
                TuVeuxAbandonnerView(
                  onClose: controller.clearUserQuitting,
                ),
              // Game
              if (controller.hasGameEnded)
                QuizzEndedView(
                  correctAnswerCount: controller.correctAnswers.length,
                  questionCount: controller.questions.length,
                  onGoHome: gotoHome,
                  onRestartQuizz: controller.onRestartQuizz,
                  onReturnToQuizzList: gotoQuizzList,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
