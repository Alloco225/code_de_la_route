import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/json_data_provider.dart';
import '../../../data/models/quizz_model.dart';

class QuizzesProvider extends GetConnect {
  final _jsonProvider = JsonDataProvider();

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List> loadAllQuizzesJson() async {
    List list = [];

    List<List<dynamic>> results = await Future.wait([
      _jsonProvider.loadJsonData('quizzes_signs'),
      _jsonProvider.loadJsonData('quizzes_degagement'),
    ]);

    for (var element in results) {
      list.addAll(element);
    }
    return list;
  }

  Future<List<Quizz>> loadAllQuizzes() async {
    List<Quizz> list = [];

    List<List<Quizz>> results = await Future.wait([
      loadQuizzByCategory('quizzes_signs'),
      loadQuizzByCategory('quizzes_degagement'),
    ]);

    for (var element in results) {
      list.addAll(element);
    }
    return list;
  }

  Future<List<Quizz>> loadQuizzByCategory(String category) async {
    final data = await _jsonProvider.loadJsonData(category);
    List<Quizz> list = [];

    for (var v in data) {
      list.add(Quizz.fromJson(v));
    }
    return list;
  }
}
