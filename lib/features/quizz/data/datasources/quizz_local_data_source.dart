import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/exceptions.dart';
import '../models/quizz_model.dart';

abstract class QuizzLocalDataSource {
  Future<void>? cacheQuizz(QuizzModel? quizzToCache);

  Future<QuizzModel> getLastQuizz();
}

const cachedQuizz = 'CACHED_QUIZZ';

class QuizzLocalDataSourceImpl implements QuizzLocalDataSource {
  final SharedPreferences sharedPreferences;

  QuizzLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuizzModel> getLastQuizz() {
    final jsonString = sharedPreferences.getString(cachedQuizz);

    if (jsonString != null) {
      return Future.value(QuizzModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheQuizz(QuizzModel? quizzToCache) async {
    if (quizzToCache != null) {
      sharedPreferences.setString(
        cachedQuizz,
        json.encode(
          quizzToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
