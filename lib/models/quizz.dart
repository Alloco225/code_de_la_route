import 'package:cdlr/models/question.dart';

class Quizz {
  final int id;
  String? categoryId;
  String? level;
  final List<Question> questions;
  Quizz({
    required this.id,
    this.categoryId,
    this.level,
    required this.questions,
  });
}
