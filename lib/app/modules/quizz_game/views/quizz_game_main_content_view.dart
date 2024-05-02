import 'package:flutter/material.dart';
import '../../../data/models/question_model.dart';
import '../../../views/widgets/question_timer_widget.dart';

class QuizzGameMainContentView extends StatelessWidget {
  const QuizzGameMainContentView({
    super.key,
    required this.currentQuestionIndex,
    required this.questions,
    required this.getQuestionWidget,
    required this.time,
    required this.percentage,
    required this.startTimer,
    required this.stopTimer,
    required this.onTimeExpired,
    required this.onTogglePause,
    required this.togglePauseTimer,
    required this.isPaused,
  });

  final int currentQuestionIndex;
  final List<Question> questions;
  final Widget getQuestionWidget;

  final time;
  final percentage;
  final startTimer;
  final stopTimer;
  final onTimeExpired;
  final onTogglePause;
  final togglePauseTimer;
  final isPaused;

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
                semanticsLabel:
                    "Question ${currentQuestionIndex + 1}/${questions.length}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                QuestionTimerWidget(
                  time: time,
                  percentage: percentage,
                  onInit: startTimer,
                  onDispose: stopTimer,
                  onTimeExpired: onTimeExpired,
                  onTogglePause: onTogglePause,
                  devPauseTimer: togglePauseTimer,
                  pause: isPaused,
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
