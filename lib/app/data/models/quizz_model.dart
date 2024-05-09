import 'package:flutter/widgets.dart';

import 'question_model.dart';

class Quizz {
  int? id;
  String? categoryId;
  String? level;
  String? name;
  IconData? icon;
  List<Question> questions = [];

  Quizz(
      {this.id,
      this.categoryId,
      this.name,
      this.level,
      required this.questions,
      this.icon});

  Quizz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'] ?? json['categoryId'];
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
    data['name'] = name;
    data['category_id'] = categoryId;
    data['level'] = level;
    data['questions'] = questions.map((v) => v.toJson()).toList();
    return data;
  }
}
