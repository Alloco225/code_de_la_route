import 'package:get/get.dart';

import '../json_data_provider.dart';
import '../models/language_model.dart';

class LanguageProvider extends GetConnect {
  final _jsonData = JsonDataProvider();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Language.fromJson(map);
      if (map is List) {
        return map.map((item) => Language.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Language>> loadLanguages() async {
    final data = await _jsonData.loadJsonData('languages');
    List<Language> list = [];

    for (var v in data) {
      list.add(Language.fromJson(v));
    }
    return list;
  }

  Future<Language?> getLanguage(int id) async {
    final response = await get('language/$id');
    return response.body;
  }

  Future<Response<Language>> postLanguage(Language language) async =>
      await post('language', language);
  Future<Response> deleteLanguage(int id) async => await delete('language/$id');
}
