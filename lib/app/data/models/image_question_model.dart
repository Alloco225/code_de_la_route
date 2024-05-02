
import 'answer_model.dart';

class ImageQuestion{
  String? categoryId;
  String? prompt;
  String? level;
  String? type;
  String? image;
  List<Answer>? answers;

  ImageQuestion(
      {this.categoryId,
      this.prompt,
      this.level,
      this.type,
      this.image,
      this.answers});

  ImageQuestion.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    prompt = json['prompt'];
    level = json['level'];
    type = json['type'];
    image = json['image'];
    if (json['answers'] != null) {
      answers = <Answer>[];
      json['answers'].forEach((v) {
        answers?.add(Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['prompt'] = prompt;
    data['level'] = level;
    data['type'] = type;
    data['image'] = image;
    if (answers != null) {
      data['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
