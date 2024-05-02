import 'package:get/get.dart';

import '../models/question_model.dart';

class QuestionProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Question.fromJson(map);
      if (map is List)
        return map.map((item) => Question.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Question?> getQuestion(int id) async {
    final response = await get('question/$id');
    return response.body;
  }

  Future<Response<Question>> postQuestion(Question question) async =>
      await post('question', question);
  Future<Response> deleteQuestion(int id) async => await delete('question/$id');
}
