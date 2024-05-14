import 'package:get/get.dart';

import '../models/order_question_model.dart';

class OrderQuestionProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return OrderQuestion.fromJson(map);
      if (map is List) {
        return map.map((item) => OrderQuestion.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<OrderQuestion?> getOrderQuestion(int id) async {
    final response = await get('orderquestion/$id');
    return response.body;
  }

  Future<Response<OrderQuestion>> postOrderQuestion(
          OrderQuestion orderquestion) async =>
      await post('orderquestion', orderquestion);
  Future<Response> deleteOrderQuestion(int id) async =>
      await delete('orderquestion/$id');
}
