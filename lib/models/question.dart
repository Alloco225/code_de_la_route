import 'package:cdlr/models/answer.dart';

class Question {
  final dynamic prompt;
  final dynamic promptType;
  final String? promptText;
  final String? image;
  final String type;
  String? categoryId;
  String? level;
  String? correctOrder;
  List<Answer>? answers = [];
  List<String>? correctAnswers = [];

  Question({
    this.prompt,
    this.promptType,
    this.promptText,
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
