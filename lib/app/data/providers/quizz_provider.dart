import 'package:get/get.dart';

import '../models/quizz_model.dart';

class QuizzProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Quizz.fromJson(map);
      if (map is List) return map.map((item) => Quizz.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Quizz?> getQuizz(int id) async {
    final response = await get('quizz/$id');
    return response.body;
  }

  Future<Response<Quizz>> postQuizz(Quizz quizz) async =>
      await post('quizz', quizz);
  Future<Response> deleteQuizz(int id) async => await delete('quizz/$id');
}
