import 'package:get/get.dart';

import '../models/sign_category_model.dart';

class SignCategoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SignCategory.fromJson(map);
      if (map is List)
        return map.map((item) => SignCategory.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
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
