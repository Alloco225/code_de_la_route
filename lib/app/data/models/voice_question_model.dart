class VoiceQuestion {
  String? categoryId;
  String? question;
  String? type;
  String? image;
  List<String>? correctAnswers;

  VoiceQuestion(
      {this.categoryId,
      this.question,
      this.type,
      this.image,
      this.correctAnswers});

  VoiceQuestion.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    question = json['question'];
    type = json['type'];
    image = json['image'];
    correctAnswers = json['correctAnswers']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['question'] = question;
    data['type'] = type;
    data['image'] = image;
    data['correctAnswers'] = correctAnswers;
    return data;
  }
}
