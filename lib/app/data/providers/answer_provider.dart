import 'package:get/get.dart';

import '../models/answer_model.dart';

class AnswerProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Answer.fromJson(map);
      if (map is List) return map.map((item) => Answer.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Answer?> getAnswer(int id) async {
    final response = await get('answer/$id');
    return response.body;
  }

  Future<Response<Answer>> postAnswer(Answer answer) async =>
      await post('answer', answer);
  Future<Response> deleteAnswer(int id) async => await delete('answer/$id');
}
