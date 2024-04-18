class QuestionEntity {
  final String categoryId;
  final String title;
  final QuestionTypeEntity? type;
  final String? image;
  final String? correctOrder;
  final List<AnswerEntity>? answers;
  final List<String>? correctVoiceAnswers;

  const QuestionEntity({
    required this.categoryId,
    required this.title,
     this.type,
    this.image,
    this.correctOrder,
    this.answers,
    this.correctVoiceAnswers,
  });
}

class QuestionTypeEntity {
  final String name;
  final String? logo;

  const QuestionTypeEntity({required this.name, this.logo});
}

class AnswerEntity {
  final String content;
  final bool? isCorrect;

  const AnswerEntity({required this.content, this.isCorrect});
}
