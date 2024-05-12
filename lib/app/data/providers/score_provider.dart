import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/score_model.dart';

class ScoreProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Score.fromJson(map);
      if (map is List) return map.map((item) => Score.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  CollectionReference scores = FirebaseFirestore.instance.collection('score');

  // Future<void> getUserScores(userId) {
  //   // Call the user's CollectionReference to add a new user
  //   // return scores
  //   //     .add({
  //   //       'full_name': fullName, // John Doe
  //   //       'company': company, // Stokes and Sons
  //   //       'age': age // 42
  //   //     })
  //   //     .then((value) => print("User Added"))
  //   //     .catchError((error) => print("Failed to add user: $error"));

  // }

  Future<Score?> getScore(int id) async {
    final response = await get('score/$id');
    return response.body;
  }

  Future<Response<Score>> postScore(Score score) async =>
      await post('score', score);
  Future<Response> deleteScore(int id) async => await delete('score/$id');
}
