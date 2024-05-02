import 'package:flutter/widgets.dart';

import 'question_model.dart';

class Quizz {
  int? id;
  String? categoryId;
  String? level;
  IconData? icon;
  List<Question>? questions;

  Quizz({this.id, this.categoryId, this.level, this.questions, this.icon});

  Quizz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    level = json['level'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions?.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['level'] = level;
    if (questions != null) {
      data['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Question {
//   String? categoryId;
//   String? questions;
//   String? level;
//   String? type;
//   String? image;
//   List<Answer>? answer;

//   Question(
//       {this.categoryId,
//       this.questions,
//       this.level,
//       this.type,
//       this.image,
//       this.answer});

//   Question.fromJson(Map<String, dynamic> json) {
//     categoryId = json['category_id'];
//     questions = json['questions'];
//     level = json['level'];
//     type = json['type'];
//     image = json['image'];
//     if (json['answer'] != null) {
//       answer = <Answer>[];
//       json['answer'].forEach((v) {
//         answer?.add(Answer.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['category_id'] = categoryId;
//     data['questions'] = questions;
//     data['level'] = level;
//     data['type'] = type;
//     data['image'] = image;
//     if (answer != null) {
//       data['answer'] = answer?.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Answer {
//   String? content;
//   bool? isCorrect;

//   Answer({this.content, this.isCorrect});

//   Answer.fromJson(Map<String, dynamic> json) {
//     content = json['content'];
//     isCorrect = json['isCorrect'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['content'] = content;
//     data['isCorrect'] = isCorrect;
//     return data;
//   }
// }
