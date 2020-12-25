import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/counter_state_notifier.dart';
part 'widgets/counter_widget.dart';

/// Counter Page
class CounterPage extends StatelessWidget {
  ///Counter constructor
  const CounterPage({Key key}) : super(key: key);

  ///Counter page route
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CounterPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            _CounterWidget()
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, watch, child) {
          var number = 0;
          final state = watch(counterNotifierProvider.state);
          if (state is CounterLoaded) number = state.number.value;
          return FloatingActionButton(
            key: const Key('fab-increase-counter'),
            onPressed: state.isLoading
                ? null
                : () {
                    context
                        .read(counterNotifierProvider)
                        .incrementCounter(number);
                  },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            backgroundColor: state.isLoading ? Colors.red : Colors.blueAccent,
          );
        },
      ),
    );
  }
}
