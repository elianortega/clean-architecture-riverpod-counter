import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

/// Interface for usecases
abstract class UseCase<Type, CounterParam> {
  /// method call on class creation
  Future<Either<Failure, Type>> call(CounterParam params);
}
