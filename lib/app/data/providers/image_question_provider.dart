import 'package:get/get.dart';

import '../models/image_question_model.dart';

class ImageQuestionProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ImageQuestion.fromJson(map);
      if (map is List) {
        return map.map((item) => ImageQuestion.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ImageQuestion?> getImageQuestion(int id) async {
    final response = await get('imagequestion/$id');
    return response.body;
  }

  Future<Response<ImageQuestion>> postImageQuestion(
          ImageQuestion imagequestion) async =>
      await post('imagequestion', imagequestion);
  Future<Response> deleteImageQuestion(int id) async =>
      await delete('imagequestion/$id');
}
