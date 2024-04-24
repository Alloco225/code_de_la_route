import 'dart:async';

import 'package:cdlr/helpers/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

const cooldownTimeBetweenAnswers = 2000; // in miliseconds

class GameStateProvider extends ChangeNotifier {
  int _currentQuestionIndex = 0;
  bool _isPaused = false;
  bool _hasGameEnded = false;
  bool _isQuitting = false;
  bool _isCorrectAnswerVisible = false;
  bool _isProcessingAnswer = false;
  int _score = 0;
  Quizz? _selectedQuizz;
  dynamic _selectedAnswer;

  final List<Map> _userResponses = [];

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get isPaused => _isPaused;
  bool get hasGameEnded => _hasGameEnded;
  bool get isQuitting => _isQuitting;
  bool get isCorrectAnswerVisible => _isCorrectAnswerVisible;
  bool get isProcessingAnswer => _isProcessingAnswer;

  dynamic get selectedAnswer => _selectedAnswer;
  List<Map> get userResponses => _userResponses;
  List<Map> get answers => _userResponses;
  List<Map> get correctAnswers =>
      answers.where((element) => element['isCorrect'] == true).toList();

  Timer? _timer;
  final int _seconds = 0;
  double _time = 0;
  final int START_TIME = 10; // seconds

  bool _pause = false;

  int get seconds => _seconds;
  double get time => _time;
  Quizz? get selectedQuizz => _selectedQuizz;

  selectQuizz(Quizz? quizz) {
    _selectedQuizz = quizz;
  }

  double get percentage => ((time * 100) / (remainingTime ?? 1)) / 100;

  double get remainingTime => START_TIME.toDouble();

  _n() {
    notifyListeners();
  }

  void startTimer() async {
    log(">> startTimer");
    await Future.delayed(const Duration(milliseconds: 500));

    _time = START_TIME * 1.0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (isPaused || hasGameEnded || _pause) return;
      _time -= 0.1;
      if (time < 0.2) {
        onTimeExpired();
        timer.cancel();
      }
      _n();
    });
  }

  togglePauseTimer() {
    _pause = !_pause;
    _n();
  }

  void stopTimer() {
    _timer?.cancel();
    _n();
  }

  void incrementScore() {
    _score++;
    _n();
  }

  startQuizz() {
    log(">> startQuizz");

    _hasGameEnded = false;
    _isPaused = false;
    _currentQuestionIndex = 0;
    _pause = false;

    _n();
    startTimer();
  }

  void endQuizz() {
    log(">> endQuizz");

    _hasGameEnded = true;

    _n();
  }

  setProcessing() {
    log(">>oo processing");
    _isProcessingAnswer = true;
    _n();
  }

  clearProcessing() {
    log("<<oo processing");

    _isProcessingAnswer = false;
    _n();
  }

  showCorrectAnswer() {
    log(">>oo correctAnswer");

    _isCorrectAnswerVisible = true;
    _n();
  }

  hideCorrectAnswer() {
    log("<<oo correctAnswer");
    _isCorrectAnswerVisible = false;
    _n();
  }

  submitAnswer() async {
    log(">> submitAnswer ${selectedAnswer.runtimeType}");
    setProcessing();

    if (selectedAnswer != null) {
      // Check if answer is correct
      bool isCorrect = false;
      String? content;
      switch (selectedAnswer.runtimeType) {
        case Answer:
          content = (selectedAnswer as Answer).content;

          if ((selectedAnswer as Answer).isCorrect == true) {
            isCorrect = true;
          }
          break;
        default:
      }
      Map answer = {
        'isCorrect': isCorrect,
        'content': content,
      };
      _userResponses.add(answer);
      log("<< submitAnswer $answer");
    }

    showCorrectAnswer();

    await Future.delayed(
        const Duration(milliseconds: cooldownTimeBetweenAnswers));
    clearProcessing();
    nextQuestion();
  }

  // void nextQuestion(BuildContext context) {
  void nextQuestion() async {
    // return;
    log(">> nextQuestion");
    hideCorrectAnswer();
    clearAnswer();
    if (currentQuestionIndex >= selectedQuizz!.questions.length - 1) {
      endQuizz();
      return;
    }
    _currentQuestionIndex++;
    _n();

    startTimer();
    // // Access the TimerProvider instance
    // TimerProvider timerProvider =
    //     Provider.of<TimerProvider>(context, listen: false);

    // // Now call the startTimer method
    // timerProvider.startTimer();
  }

  void togglePause() {
    _isPaused = !_isPaused;
    _n();
  }

  onTimeExpired() async {
    log("!! onTimeExpired");

    submitAnswer();
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
    // showInitialLoader
    startQuizz();
    //
    // restart timer and stuff
  }

  onQuit() {
    log("!! onQuit");
    setUserQuitting();
  }

  doubleTapAnswerToSubmit(dynamic answer) {
    log(">> doubleTapAnswerToSubmit $answer");
    if (_selectedAnswer == answer) {
      submitAnswer();
    }
    selectAnswer(answer);
  }

  toggleSelectAnswer(dynamic answer) {
    _selectedAnswer = _selectedAnswer == answer ? null : answer;
    _n();
  }

  selectAnswer(dynamic answer) {
    if (isProcessingAnswer) return;
    log(">> selectAnswer $answer");

    _selectedAnswer = answer;
    _n();
  }

  clearAnswer() {
    log(">> clearAnswer");
    _selectedAnswer = null;
    _n();
  }

  setUserQuitting() {
    log(">> setUserQuitting");

    _isQuitting = true;
    _n();
  }

  clearUserQuitting() {
    log("<< setUserQuitting");

    _isQuitting = false;

    togglePause();
    _n();
  }
}
