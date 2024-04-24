import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

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

  final List<Map> _responses = [];

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get isPaused => _isPaused;
  bool get hasGameEnded => _hasGameEnded;
  bool get isQuitting => _isQuitting;
  bool get isCorrectAnswerVisible => _isCorrectAnswerVisible;
  bool get isProcessingAnswer => _isProcessingAnswer;

  dynamic get selectedAnswer => _selectedAnswer;
  List<Map> get responses => _responses;

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

  void startTimer() async {
    debugPrint(">> startTimer");
    await Future.delayed(const Duration(milliseconds: 500));

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
    debugPrint(">> endQuizz");

    _hasGameEnded = true;

    notifyListeners();
  }

  setProcessing() {
    debugPrint(">> processing");
    _isProcessingAnswer = true;
    notifyListeners();
  }

  clearProcessing() {
    debugPrint("<< processing");

    _isProcessingAnswer = false;
    notifyListeners();
  }

  showCorrectAnswer() {
    _isCorrectAnswerVisible = true;
    notifyListeners();
  }

  hideCorrectAnswer() {
    _isCorrectAnswerVisible = false;
    notifyListeners();
  }

  submitAnswer() async {
    debugPrint(">> submitAnswer ${selectedAnswer.runtimeType}");
    setProcessing();
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

    showCorrectAnswer();

    _responses.add(answer);
    debugPrint("<< submitAnswer $answer");

    await Future.delayed(const Duration(milliseconds: 300));
    clearProcessing();
    nextQuestion();
  }

  // void nextQuestion(BuildContext context) {
  void nextQuestion() async {
    debugPrint(">> nextQuestion");
    hideCorrectAnswer();
    clearAnswer();
    if (currentQuestionIndex >= selectedQuizz!.questions.length - 1) {
      endQuizz();
      return;
    }
    _currentQuestionIndex++;
    notifyListeners();

    startTimer();
    // // Access the TimerProvider instance
    // TimerProvider timerProvider =
    //     Provider.of<TimerProvider>(context, listen: false);

    // // Now call the startTimer method
    // timerProvider.startTimer();
  }

  void togglePause() {
    _isPaused = !_isPaused;
    notifyListeners();
  }

  onTimeExpired() {
    debugPrint("!! onTimeExpired");
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

  doubleTapAnswerToSubmit(dynamic answer) {
    debugPrint(">> doubleTapAnswerToSubmit $answer");
    if (_selectedAnswer == null) {
      selectAnswer(answer);
      return;
    }
    submitAnswer();
  }

  toggleSelectAnswer(dynamic answer) {
    _selectedAnswer = _selectedAnswer == answer ? null : answer;
    notifyListeners();
  }

  selectAnswer(dynamic answer) {
    if (isProcessingAnswer) return;
    debugPrint(">> selectAnswer $answer");

    _selectedAnswer = answer;
    notifyListeners();
  }

  clearAnswer() {
    debugPrint(">> clearAnswer");
    _selectedAnswer = null;
    notifyListeners();
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
