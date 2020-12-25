part of '../counter_page.dart';

class _CounterWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(counterNotifierProvider.state);
    if (state is CounterLoading) {
      return CircularProgressIndicator(
        key: loadingIndicatorKey,
      );
    } else if (state is CounterLoaded) {
      return Text(
        '${state.number.value}',
        key: const Key('loaded-text'),
        style: Theme.of(context).textTheme.headline4,
      );
    } else if (state is CounterInitial) {
      return Text(
        '${state.number.value}',
        style: Theme.of(context).textTheme.headline4,
      );
    } else if (state is CounterError) {
      return Text(
        '${state.message}',
        style: Theme.of(context).textTheme.headline6,
      );
    }
    return const SizedBox.shrink();
  }
}
