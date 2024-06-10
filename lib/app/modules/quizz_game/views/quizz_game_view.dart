import 'package:codedelaroute/app/modules/quizz_game/views/quizz_game_main_content_view.dart';
import 'package:codedelaroute/app/views/widgets/fancy_button_widget.dart';
// import 'package:codedelaroute/app/views/widgets/back_nav_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

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
    Get.toNamed(Routes.HOME);
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
        // Navigator.pop(context, false);
        // return Future.value(false);
        controller.togglePause();
      },
      child: Scaffold(
        body: Obx(() {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.quizzNotFound) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Ionicons.warning_outline,
                  size: 86,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "quizz_not_found".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(
                  height: 10,
                ),
                // const BackNavButton()
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Ionicons.chevron_back),
                            const SizedBox(width: 10),
                            Text(
                              'back'.tr,
                              semanticsLabel: 'back'.tr,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }

          return Stack(
            children: [
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
                  onQuit: controller.onQuit,
                  onClose: controller.endQuizz,
                ),
              if (controller.isQuitting)
                TuVeuxAbandonnerView(
                  onClose: controller.clearUserQuitting,
                ),
              // Game
              if (controller.hasGameEnded)
                QuizzEndedView(
                  correctAnswers: controller.correctAnswers,
                  questionCount: controller.questions.length,
                  onGoHome: gotoHome,
                  onRestartQuizz: controller.onRestartQuizz,
                  onReturnToQuizzList: gotoQuizzList,
                ),
            ],
          );
        }),
      ),
    );
  }
}
