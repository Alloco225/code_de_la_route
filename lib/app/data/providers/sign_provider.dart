import 'package:get/get.dart';

import '../json_data_provider.dart';
import '../models/sign_model.dart';

class SignProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Sign.fromJson(map);
      if (map is List) return map.map((item) => Sign.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Sign>> loadAllSigns() async {
    final allCategories =
        await JsonDataProvider().loadJsonData('sign_categories');
    List pathsToLoad =
        allCategories.map((category) => 'signs_${category['id']}').toList();
    List<Sign> list = [];

    List<List<Sign>> results = await Future.wait(
        pathsToLoad.map((path) => loadSignByCategory(path)).toList());

    for (var element in results) {
      list.addAll(element);
    }
    return list;
  }

  Future<List<Sign>> loadSignByCategory(String category) async {
    final data = await JsonDataProvider().loadJsonData(category);
    List<Sign> list = [];

    for (var v in data) {
      list.add(Sign.fromJson(v));
    }
    return list;
  }

  Future<Sign?> getSign(int id) async {
    final response = await get('sign/$id');
    return response.body;
  }

  Future<Response<Sign>> postSign(Sign sign) async => await post('sign', sign);
  Future<Response> deleteSign(int id) async => await delete('sign/$id');
}
