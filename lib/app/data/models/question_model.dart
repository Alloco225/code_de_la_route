import 'answer_model.dart';

class Question {
  String? categoryId;
  String? prompt;
  String? question;
  String? level;
  String? type;
  String? image;
  List<Answer>? answers;
  // List<String> images = [];
  String? correctOrder;
  List<String>? correctAnswers;

  String get promptKey {
    if (correctOrder != null) {
      return 'order_question_prompt';
    }
    if(image != null && image!.isNotEmpty){
      return 'image_question_prompt';
    }
    // if(images.isNotEmpty){
    //   return 'image_question_prompt';
    // }

    return 'image_question_prompt';
  }

  Question(
      {this.categoryId,
      this.prompt,
      this.question,
      this.level,
      this.type,
      this.image,
      this.answers,
      this.correctOrder,
      this.correctAnswers});

  Question.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    prompt = json['prompt'];
    question = json['question'];
    level = json['level'];
    type = json['type'];
    image = json['image'];
    if (json['answers'] != null) {
      answers = <Answer>[];
      json['answers'].forEach((v) {
        answers?.add(Answer.fromJson(v));
      });
    }
    correctOrder = json['correct_order'];
    correctAnswers = json['correct_answers']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['prompt'] = prompt;
    data['question'] = question;
    data['level'] = level;
    data['type'] = type;
    data['image'] = image;
    if (answers != null) {
      data['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    data['correct_order'] = correctOrder;
    data['correct_answers'] = correctAnswers;
    return data;
  }
}
