import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/repositories/number_trivia_repositories.dart';
import '../entities/number_trivia.dart';


class GetRandomNumberTrivia implements UseCase<NumberTrivia,NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);
  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async{
    return await repository.getRandomNumberTrivia();
  }
}

