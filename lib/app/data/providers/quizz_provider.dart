import 'package:get/get.dart';

import '../json_data_provider.dart';
import '../models/quizz_model.dart';

class QuizzProvider extends GetConnect {
  final _jsonData = JsonDataProvider();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Quizz.fromJson(map);
      if (map is List) return map.map((item) => Quizz.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Quizz>> loadQuizz() async {
    final data = await _jsonData.loadJsonData('quizzes');
    List<Quizz> list = [];

    for (var v in data) {
      list.add(Quizz.fromJson(v));
    }
    return list;
  }

  Future<Quizz?> getQuizz(int id) async {
    final response = await get('quizz/$id');
    return response.body;
  }

  Future<Response<Quizz>> postQuizz(Quizz quizz) async =>
      await post('quizz', quizz);
  Future<Response> deleteQuizz(int id) async => await delete('quizz/$id');
}
