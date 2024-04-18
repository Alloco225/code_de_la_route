import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/quizz_entity.dart';

abstract class QuizzRepository {
  Future<Either<Failure, QuizzEntity>> getQuizz({required QuizzParams params});
}
