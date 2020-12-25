import 'package:equatable/equatable.dart';

///Abstract class that models the most common failures scenarios of app
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

/// Server Failure
class ServerFailure extends Failure {}

/// Cache Failure
class CacheFailure extends Failure {}
