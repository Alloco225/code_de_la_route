import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../business/entities/quizz_entity.dart';
import '../../business/usecases/get_quizz.dart';
import '../../data/datasources/quizz_local_data_source.dart';
import '../../data/datasources/quizz_remote_data_source.dart';
import '../../data/repositories/quizz_repository_impl.dart';

class QuizzProvider extends ChangeNotifier {
  QuizzEntity? quizz;
  Failure? failure;

  QuizzProvider({
    this.quizz,
    this.failure,
  });

  void eitherFailureOrQuizz({
    required String value,
  }) async {
    QuizzRepositoryImpl repository = QuizzRepositoryImpl(
      remoteDataSource: QuizzRemoteDataSourceImpl(dio: Dio()),
      localDataSource: QuizzLocalDataSourceImpl(
          sharedPreferences: await SharedPreferences.getInstance()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrQuizz = await GetQuizz(repository).call(
      params: QuizzParams(id: value),
    );

    failureOrQuizz.fold(
      (newFailure) {
        quizz = null;
        failure = newFailure;
        notifyListeners();
      },
      (newQuizz) {
        quizz = newQuizz;
        failure = null;
        notifyListeners();
      },
    );
  }
}
