part of 'counter_state_notifier.dart';

//External
final _connetionCheckerProvider = Provider<DataConnectionChecker>(
  (ref) => DataConnectionChecker(),
);

// Repository Provider
final _networkInfoProvider = Provider<NetworkInfo>(
  (ref) => INetworkInfo(ref.watch(_connetionCheckerProvider)),
);

// Data Source
final _numberRemoteDataSourceProvider = Provider<NumberRemoteDataSource>(
  (ref) => INumberRemoteDataSource(),
);

final _counterRepositoryProvider = Provider<CounterRepository>(
  (ref) => ICounterRepository(
    numberRemoteDataSource: ref.watch(_numberRemoteDataSourceProvider),
    networkInfo: ref.watch(_networkInfoProvider),
  ),
);

//Use Cases
final _incrementCounterProvider = Provider<IncrementCounter>(
  (ref) => IncrementCounter(
    counterRepo: ref.watch(_counterRepositoryProvider),
  ),
);
