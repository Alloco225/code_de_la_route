import '../../../../../core/constants/constants.dart';
import '../../business/entities/sub_entites.dart';

//! Question
class QuestionModel extends QuestionEntity {
  const QuestionModel({
    required String categoryId,
    required String title,
    // required QuestionTypeEntity type,
  }) : super(
    categoryId: categoryId,
title: title,
// type: type,
  );

  static QuestionModel fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      categoryId: json[kCategoryId],
      title: json[kTitle],
      // type: json[type],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kCategoryId: categoryId,
      kTitle: title,
    };
  }
}
