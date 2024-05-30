class Answer {
  String? signId;
  String? content;
  String? questionId;
  bool? isCorrect;

  Answer({this.content, this.questionId, this.isCorrect, this.signId,});

  Answer.fromJson(Map<String, dynamic> json) {
    signId = json['sign_id'];
    content = json['content'];
    questionId = json['question_id'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sign_id'] = signId;
    data['content'] = content;
    data['question_id'] = questionId;
    data['isCorrect'] = isCorrect;
    return data;
  }
}
