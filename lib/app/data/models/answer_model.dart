class Answer {
  String? content;
  String? questionId;
  bool? isCorrect;

  Answer({this.content, this.questionId, this.isCorrect});

  Answer.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    questionId = json['question_id'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['content'] = content;
    data['question_id'] = questionId;
    data['isCorrect'] = isCorrect;
    return data;
  }

  @override
  String toString() {
    return "${toJson()}";
  }
}
