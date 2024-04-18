import 'package:flutter_mapp_clean_architecture/features/quizz/business/entities/sub_entites.dart';

import 'sub_models.dart';
import '../../../../../core/constants/constants.dart';
import '../../business/entities/quizz_entity.dart';

class QuizzModel extends QuizzEntity {
  const QuizzModel({
    required int id,
    // required List<QuestionModel> questions,
  }) : super(
          id: id,
          // questions: questions,
        );

  factory QuizzModel.fromJson(Map<String, dynamic> json) {
    return QuizzModel(
      id: json[kId],
      // questions: QuestionModel.fromJson(json[kSprites]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kId: id,
      // kQuestions: questions,
    };
  }
}
