class Score {
  String? userId;
  String? quizzId;
  String? date;
  String? points;

  Score({this.userId, this.quizzId, this.date, this.points});

  Score.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    quizzId = json['quizz_id'];
    date = json['date'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['quizz_id'] = quizzId;
    data['date'] = date;
    data['points'] = points;
    return data;
  }
}
