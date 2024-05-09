import 'package:codedelaroute/app/data/json_data_provider.dart';
import 'package:get/get.dart';

import '../models/sign_category_model.dart';

class SignCategoryProvider extends GetConnect {
  final _jsonData = JsonDataProvider();
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SignCategory.fromJson(map);
      if (map is List)
        return map.map((item) => SignCategory.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<SignCategory>> loadSignCategory() async {
    final data = await _jsonData.loadJsonData('sign_categories');
    List<SignCategory> list = [];

    data.forEach((v) {
      list.add(SignCategory.fromJson(v));
    });
    return list;
  }

  Future<SignCategory?> getSignCategory(int id) async {
    final response = await get('signcategory/$id');
    return response.body;
  }

  Future<Response<SignCategory>> postSignCategory(
          SignCategory signcategory) async =>
      await post('signcategory', signcategory);
  Future<Response> deleteSignCategory(int id) async =>
      await delete('signcategory/$id');
}
