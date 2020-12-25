import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:counter/src/domain/entities/number.dart';

/// Counter Repository Interface
abstract class CounterRepository {
  /// Add 1 to the number passed as parameter
  Future<Either<Failure, Number>> addOneToNumber(int number);
}
