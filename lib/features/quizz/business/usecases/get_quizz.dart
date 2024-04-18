import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/quizz_entity.dart';
import '../repositories/quizz_repository.dart';

class GetQuizz {
  final QuizzRepository repository;

  GetQuizz(this.repository);

  Future<Either<Failure, QuizzEntity>> call({required QuizzParams params}) async {
    return await repository.getQuizz(params: params);
  }
}
