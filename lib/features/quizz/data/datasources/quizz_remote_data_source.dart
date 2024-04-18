import 'package:dio/dio.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../core/params/params.dart';
import '../models/quizz_model.dart';

abstract class QuizzRemoteDataSource {
  Future<QuizzModel> getQuizz({required QuizzParams params});
}

class QuizzRemoteDataSourceImpl implements QuizzRemoteDataSource {
  final Dio dio;

  QuizzRemoteDataSourceImpl({required this.dio});

  @override
  Future<QuizzModel> getQuizz({required QuizzParams params}) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/quizz/${params.id}',
      queryParameters: {
        'api_key': 'if you need',
      },
    );

    if (response.statusCode == 200) {
      return QuizzModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
