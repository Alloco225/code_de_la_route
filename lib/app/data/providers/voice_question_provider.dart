import 'package:get/get.dart';

import '../models/voice_question_model.dart';

class VoiceQuestionProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return VoiceQuestion.fromJson(map);
      if (map is List)
        return map.map((item) => VoiceQuestion.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<VoiceQuestion?> getVoiceQuestion(int id) async {
    final response = await get('voicequestion/$id');
    return response.body;
  }

  Future<Response<VoiceQuestion>> postVoiceQuestion(
          VoiceQuestion voicequestion) async =>
      await post('voicequestion', voicequestion);
  Future<Response> deleteVoiceQuestion(int id) async =>
      await delete('voicequestion/$id');
}
