import 'dart:async';

import 'package:cdlr/widgets/question_image_widget.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class GameStateProvider extends ChangeNotifier {
  int _currentQuestionIndex = 0;
  bool _isPaused = false;
  bool _hasGameEnded = false;
  bool _isQuitting = false;
  final bool _isCorrectAnswerVisible = false;
  int _score = 0;
  Quizz? _selectedQuizz;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get isPaused => _isPaused;
  bool get hasGameEnded => _hasGameEnded;
  bool get isQuitting => _isQuitting;
  bool get isCorrectAnswerVisible => _isCorrectAnswerVisible;

  Timer? _timer;
  final int _seconds = 0;
  double _time = 0;
  final int START_TIME = 10; // seconds

  int get seconds => _seconds;
  double get time => _time;
  Quizz? get selectedQuizz => _selectedQuizz;

  selectQuizz(Quizz? quizz) {
    _selectedQuizz = quizz;
  }

  double get percentage => ((time * 100) / (remainingTime ?? 1)) / 100;

  double get remainingTime => START_TIME.toDouble();

  void startTimer() {
    _time = START_TIME * 1.0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (isPaused || hasGameEnded) return;
      _time -= 0.1;
      if (time < 0.2) {
        onTimeExpired();
        timer.cancel();
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    notifyListeners();
  }

  void incrementScore() {
    _score++;
    notifyListeners();
  }

  void endQuizz() {
    _hasGameEnded = true;

    notifyListeners();
  }

  // void nextQuestion(BuildContext context) {
  void nextQuestion() {
    if (currentQuestionIndex >= selectedQuizz!.questions.length - 1) {
      endQuizz();
      return;
    }
    _currentQuestionIndex++;
    startTimer();
    // // Access the TimerProvider instance
    // TimerProvider timerProvider =
    //     Provider.of<TimerProvider>(context, listen: false);

    // // Now call the startTimer method
    // timerProvider.startTimer();
    notifyListeners();
  }

  void togglePause() {
    _isPaused = !_isPaused;
    notifyListeners();
  }

  onTimeExpired() {
    // DIsplay modal
    nextQuestion();
  }

  onTogglePause() {
    togglePause();
    if (_isPaused) {
      //
    }
  }

  onGameResume() {
    togglePause();
    //
  }

  onRestartQuizz() {
    // Restart quizz
    _currentQuestionIndex = 0;
    // restart timer and stuff
  }

  onQuit() {
    setUserQuitting();
  }

  setUserQuitting() {
    _isQuitting = true;
    notifyListeners();
  }

  clearUserQuitting() {
    _isQuitting = false;

    togglePause();
    notifyListeners();
  }
}
