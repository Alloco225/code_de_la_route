import 'sub_entites.dart';

class QuizzEntity {
  final int id;
  final List<QuestionEntity>? questions;

  const QuizzEntity({
    required this.id,
    this.questions,
  });
}
