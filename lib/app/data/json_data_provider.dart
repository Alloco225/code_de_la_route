import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class JsonDataProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<dynamic>> loadJsonData(String path) async {
    String jsonString = await rootBundle.loadString('assets/data/$path.json');
    List<dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }
}
