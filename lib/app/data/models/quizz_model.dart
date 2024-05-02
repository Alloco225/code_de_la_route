import 'package:flutter/widgets.dart';

import 'question_model.dart';

class Quizz {
  int? id;
  String? categoryId;
  String? level;
  IconData? icon;
  List<Question> questions = [];

  Quizz({this.id, this.categoryId, this.level, required this.questions, this.icon});

  Quizz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    level = json['level'];
    questions = <Question>[];
    if (json['questions'] != null) {
      json['questions'].forEach((v) {
        questions.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['level'] = level;
    data['questions'] = questions.map((v) => v.toJson()).toList();
    return data;
  }
}
