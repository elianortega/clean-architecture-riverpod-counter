import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

/// Class with the params for counter repository
class CounterParam extends Equatable {
  ///Counter
  CounterParam({@required this.number});

  ///Param number value
  final int number;

  @override
  List<Object> get props => [number];
}
