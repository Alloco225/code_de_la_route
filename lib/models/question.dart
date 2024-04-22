import 'package:cdlr/models/answer.dart';

class Question {
  final String prompt;
  final String? image;
  final String type;
  String? categoryId;
  String? level;
  String? correctOrder;
  List<Answer>? answers = [];
  List<String>? correctAnswers = [];

  Question({
    required this.prompt,
    this.categoryId,
    this.level,
    this.image,
    this.correctOrder,
    this.correctAnswers,
    this.answers,
    required this.type,
  });

}

class QuestionImage {
  final String? prompt;
  final String? image;

  QuestionImage({
    this.prompt,
    this.image,
  });
}

class QuestionVoice {
  final String? prompt;
  final String? image;

  QuestionVoice({
    this.prompt,
    this.image,
  });
}
