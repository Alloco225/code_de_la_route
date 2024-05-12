class Test {
  String? quizzId;
  String? userId;
  double? score;
  String? date;

  Test({this.quizzId, this.userId, this.score, this.date});

  Test.fromJson(Map<String, dynamic> json) {
    quizzId = json['quizz_id'];
    userId = json['user_id'];
    score = (json['score'] as num?)?.toDouble();
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['quizz_id'] = quizzId;
    data['user_id'] = userId;
    data['score'] = score;
    data['date'] = date;
    return data;
  }
}
