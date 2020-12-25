import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:network_info/src/domain/network_info.dart';

///Network info implementation
class INetworkInfo implements NetworkInfo {
  ///Constructor for NetworkInfo Implementation
  INetworkInfo(this._connectionChecker);

  final DataConnectionChecker _connectionChecker;

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
