import 'package:errors/errors.dart';
import 'package:meta/meta.dart';
import 'package:network_info/network_info.dart';
import 'package:counter/src/data/data_sources/number_remote_datasource.dart';
import 'package:counter/src/domain/entities/number.dart';
import 'package:dartz/dartz.dart';
import 'package:counter/src/domain/repositories/counter_repository.dart';

typedef _IncrementCounter = Future<Number> Function();

///COunter repo implementation
class ICounterRepository implements CounterRepository {
  ///Counter repo constructor
  ICounterRepository({
    @required NumberRemoteDataSource numberRemoteDataSource,
    @required NetworkInfo networkInfo,
  })  : assert(numberRemoteDataSource != null),
        assert(networkInfo != null),
        _numberRemoteDataSource = numberRemoteDataSource,
        _networkInfo = networkInfo;

  final NumberRemoteDataSource _numberRemoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, Number>> addOneToNumber(int number) {
    return _getCounter(() => _numberRemoteDataSource.incrementCounter(number));
  }

  Future<Either<Failure, Number>> _getCounter(
    _IncrementCounter incrementCounter,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final number = await incrementCounter();
        return Right(number);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
