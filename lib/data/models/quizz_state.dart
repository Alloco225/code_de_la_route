class QuizzState {
  bool isPaused = false;
  int currentQuestionIndex = 0;

  QuizzState({
    required this.isPaused,
    required this.currentQuestionIndex,
  });
}
