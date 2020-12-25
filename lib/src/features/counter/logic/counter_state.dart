part of 'counter_state_notifier.dart';
// ignore_for_file: public_member_api_docs

abstract class CounterState extends Equatable {
  CounterState();

  bool get isLoading => false;
}

class CounterInitial extends CounterState {
  CounterInitial(this.number);
  final Number number;
  @override
  List<Object> get props => [];
}

class CounterLoading extends CounterState {
  CounterLoading();

  @override
  bool get isLoading => true;

  @override
  List<Object> get props => [];
}

class CounterLoaded extends CounterState {
  CounterLoaded(this.number);

  final Number number;
  @override
  List<Object> get props => [number];
}

class CounterError extends CounterState {
  CounterError(this.message);

  final String message;
  @override
  List<Object> get props => [message];
}
