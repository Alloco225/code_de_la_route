import 'package:get/get.dart';

import '../models/quizz_category_model.dart';

class QuizzCategoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return QuizzCategory.fromJson(map);
      if (map is List) {
        return map.map((item) => QuizzCategory.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<QuizzCategory?> getQuizzCategory(int id) async {
    final response = await get('category/$id');
    return response.body;
  }

  Future<Response<QuizzCategory>> postQuizzCategory(
          QuizzCategory category) async =>
      await post('category', category);
  Future<Response> deleteQuizzCategory(int id) async =>
      await delete('category/$id');
}
