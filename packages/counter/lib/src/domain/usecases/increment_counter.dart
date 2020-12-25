import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../entities/counter_param.dart';
import '../entities/number.dart';
import '../repositories/counter_repository.dart';

import 'usecase.dart';

///Increment Counter usecase
class IncrementCounter implements UseCase<Number, CounterParam> {
  /// Increment Counter constructor
  IncrementCounter({
    @required CounterRepository counterRepo,
  })  : assert(counterRepo != null),
        _counterRepo = counterRepo;

  final CounterRepository _counterRepo;

  @override
  Future<Either<Failure, Number>> call(CounterParam params) async {
    return await _counterRepo.addOneToNumber(params.number);
  }
}
