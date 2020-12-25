import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:network_info/network_info.dart';
import 'package:riverpod/all.dart';
import 'package:counter/counter.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

part 'counter_state.dart';
part 'counter_provider.dart';

/// Counter State notifier
final counterNotifierProvider = StateNotifierProvider(
  (ref) =>
      CounterNotifier(incrementCounter: ref.watch(_incrementCounterProvider)),
);

///CounterNotifier implementation of StateNotifier for CounterState
class CounterNotifier extends StateNotifier<CounterState> {
  ///Counter Notifier Constructor
  CounterNotifier({
    @required IncrementCounter incrementCounter,
  })  : assert(incrementCounter != null),
        _incrementCounter = incrementCounter,
        super(CounterInitial(Number(value: 0)));

  final IncrementCounter _incrementCounter;

  ///Method that increments the counter
  Future<void> incrementCounter(int number) async {
    state = CounterLoading();
    final failureOrCounter = await _incrementCounter.call(
      CounterParam(number: number),
    );

    state = _eitherLoadedOrErrorState(failureOrCounter);
  }

  CounterState _eitherLoadedOrErrorState(
    Either<Failure, Number> failureOrTrivia,
  ) {
    return failureOrTrivia.fold(
      (failure) => CounterError('Error occured: ${failure.toString()}'),
      (number) => CounterLoaded(number),
    );
  }
}
