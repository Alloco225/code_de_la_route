import 'package:flutter/material.dart';

class GameStateProvider extends ChangeNotifier {
  int _currentQuestionIndex = 0;
  bool _isPaused = false;
  int _score = 0;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get isPaused => _isPaused;

  void incrementScore() {
    _score++;
    notifyListeners();
  }

  void nextQuestion() {
    _currentQuestionIndex++;
    notifyListeners();
  }

  void togglePause() {
    _isPaused = !_isPaused;
    notifyListeners();
  }
}
