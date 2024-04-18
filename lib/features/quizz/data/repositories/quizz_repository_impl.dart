import 'package:dartz/dartz.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../business/repositories/quizz_repository.dart';
import '../datasources/quizz_local_data_source.dart';
import '../datasources/quizz_remote_data_source.dart';
import '../models/quizz_model.dart';

class QuizzRepositoryImpl implements QuizzRepository {
  final QuizzRemoteDataSource remoteDataSource;

  final QuizzLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  QuizzRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, QuizzModel>> getQuizz(
      {required QuizzParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteQuizz =
            await remoteDataSource.getQuizz(params: params);

        localDataSource.cacheQuizz(remoteQuizz);

        return Right(remoteQuizz);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        final localQuizz = await localDataSource.getLastQuizz();
        return Right(localQuizz);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'No local data found'));
      }
    }
  }
}
