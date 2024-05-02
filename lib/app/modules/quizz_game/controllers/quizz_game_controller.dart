import 'dart:async';

import 'package:get/get.dart';

import '../../../const/game_settings.dart';
import '../../../data/db/db.dart';
import '../../../data/models/answer_model.dart';
import '../../../data/models/question_model.dart';
import '../../../data/models/quizz_model.dart';
import '../../../helpers/utils.dart';

class QuizzGameController extends GetxController {
  final _categoryId = "".obs;
  final _quizzId = "".obs;

  @override
  void onInit() {
    super.onInit();

    var routeParams = Get.arguments as Map?;

    _categoryId.value = routeParams?['categoryId'];
    _quizzId.value = routeParams?['quizzId'];

    _selectedQuizz.value = QUIZZES.firstWhere(
        (el) => el.categoryId == _categoryId.value && el.id == _quizzId.value);

    _isLoading.value = false;
  }

  var _currentQuestionIndex = 0.obs;
  final _isLoading = false.obs;
  final _isPaused = false.obs;
  final _hasGameEnded = false.obs;
  final _isQuitting = false.obs;
  final _isCorrectAnswerVisible = false.obs;
  final _isProcessingAnswer = false.obs;

  var _score = 0.obs;
  final Rx<Quizz?> _selectedQuizz = null.obs;
  dynamic _selectedAnswer;

  final _userResponses = <Map>[].obs;

  bool get isLoading => _isLoading.value;
  List<Question> get questions => selectedQuizz?.questions ?? [];

  Question get currentQuestion => questions[currentQuestionIndex];

  int get currentQuestionIndex => _currentQuestionIndex.value;
  int get score => _score.value;
  bool get isPaused => _isPaused.value;
  bool get hasGameEnded => _hasGameEnded.value;
  bool get isQuitting => _isQuitting.value;
  bool get isCorrectAnswerVisible => _isCorrectAnswerVisible.value;
  bool get isProcessingAnswer => _isProcessingAnswer.value;
  bool get pause => _pause.value;

  dynamic get selectedAnswer => _selectedAnswer.value;
  List<Map> get userResponses => _userResponses.value;
  List<Map> get answers => userResponses;
  List<Map> get correctAnswers =>
      answers.where((element) => element['isCorrect'] == true).toList();

  Timer? _timer;
  final int _seconds = 0;
  double _time = 0;
  final int START_TIME = 10; // seconds

  final _pause = false.obs;

  int get seconds => _seconds;
  double get time => _time;
  Quizz? get selectedQuizz => _selectedQuizz.value;
  Quizz? get quizz => selectedQuizz;

  selectQuizz(Quizz? quizz) {
    _selectedQuizz.value = quizz;
  }

  double get percentage => ((time * 100) / (remainingTime ?? 1)) / 100;

  double get remainingTime => START_TIME.toDouble();

  void startTimer() async {
    // return;
    if (selectedQuizz == null) return;
    if (selectedQuizz!.questions.isEmpty) return;
    log(">> startTimer");
    await Future.delayed(const Duration(milliseconds: 500));

    _time = START_TIME * 1.0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (isPaused || hasGameEnded || pause) return;
      if (isProcessingAnswer) return;
      _time -= 0.1;
      if (time < 0.2) {
        onTimeExpired();
        timer.cancel();
      }
    });
  }

  togglePauseTimer() {
    _pause.value = !pause;
  }

  void stopTimer() {
    log("<< stopTimer");
    _timer?.cancel();
  }

  void incrementScore() {
    _score++;
  }

  startQuizz() {
    log(">> startQuizz");

    _hasGameEnded.value = false;
    _isPaused.value = false;
    _currentQuestionIndex.value = 0;
    _pause.value = false;
    _userResponses.value = [];

    startTimer();
  }

  clearQuizz() {
    _hasGameEnded.value = false;
    _isPaused.value = false;
    _currentQuestionIndex.value = 0;
    _pause.value = false;
    _selectedAnswer.value = null;
    _isCorrectAnswerVisible.value = false;
    _isProcessingAnswer.value = false;
    _selectedQuizz.value = null;
  }

  void endQuizz() {
    log(">> endQuizz");

    _hasGameEnded.value = true;
  }

  setProcessing() {
    log(">>oo processing");
    _isProcessingAnswer.value = true;
  }

  clearProcessing() {
    log("<<oo processing");

    _isProcessingAnswer.value = false;
  }

  showCorrectAnswer() {
    log(">>oo correctAnswer");

    _isCorrectAnswerVisible.value = true;
  }

  hideCorrectAnswer() {
    log("<<oo correctAnswer");
    _isCorrectAnswerVisible.value = false;
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

  void nextQuestion() async {
    // return;
    if (isProcessingAnswer) return;
    log(">> nextQuestion");
    hideCorrectAnswer();
    clearAnswer();
    if (selectedQuizz != null) {
      if (currentQuestionIndex >= selectedQuizz!.questions.length - 1) {
        endQuizz();
        return;
      }
    }
    _currentQuestionIndex++;

    startTimer();
    // // Access the TimerProvider instance
    // TimerProvider timerProvider =
    //     Provider.of<TimerProvider>(context, listen: false);

    // // Now call the startTimer method
    // timerProvider.startTimer();
  }

  void togglePause() {
    _isPaused.value = !isPaused;
  }

  onTimeExpired() async {
    log("!! onTimeExpired");

    submitAnswer();
  }

  onTogglePause() {
    togglePause();
    if (isPaused) {
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
  }

  selectAnswer(dynamic answer) {
    if (isProcessingAnswer) return;
    log(">> selectAnswer $answer");

    _selectedAnswer = answer;
  }

  clearAnswer() {
    log(">> clearAnswer");
    _selectedAnswer = null;
  }

  setUserQuitting() {
    log(">> setUserQuitting");

    _isQuitting.value = true;
  }

  clearUserQuitting() {
    log("<< setUserQuitting");

    _isQuitting.value = false;

    togglePause();
  }
}
