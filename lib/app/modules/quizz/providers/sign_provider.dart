import 'package:get/get.dart';

import '../sign_model.dart';

class SignProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Sign.fromJson(map);
      if (map is List) return map.map((item) => Sign.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Sign?> getSign(int id) async {
    final response = await get('sign/$id');
    return response.body;
  }

  Future<Response<Sign>> postSign(Sign sign) async => await post('sign', sign);
  Future<Response> deleteSign(int id) async => await delete('sign/$id');
}
