import 'package:flutter/material.dart';

class GameStateProvider extends ChangeNotifier {
  int _currentQuestionIndex = 0;
  bool _isPaused = false;
  bool _isQuitting = false;
  int _score = 0;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get isPaused => _isPaused;
  bool get isQuitting => _isQuitting;

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

  onTimeExpired() {}

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
