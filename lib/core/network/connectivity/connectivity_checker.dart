import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityChecker {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}

class ConnectivityCheckerImpl implements ConnectivityChecker {
  const ConnectivityCheckerImpl(this._connectivity);

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result.any((r) => r != ConnectivityResult.none);
  }

  @override
  Stream<bool> get onConnectivityChanged => _connectivity.onConnectivityChanged
      .map((result) => result.any((r) => r != ConnectivityResult.none));
}
