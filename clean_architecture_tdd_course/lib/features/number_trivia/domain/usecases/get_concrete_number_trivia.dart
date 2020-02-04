import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/repositories/number_trivia_repositories.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>>  execute({
    @required int number
  }) async{
    return await repository.getConcreteNumberTrivia(number);

  }
}