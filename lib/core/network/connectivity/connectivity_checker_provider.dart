import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/network/connectivity/connectivity_checker.dart';

part 'connectivity_checker_provider.g.dart';

@Riverpod(keepAlive: true)
Connectivity connectivity(Ref ref) => Connectivity();

@Riverpod(keepAlive: true)
ConnectivityChecker connectivityChecker(Ref ref) =>
    ConnectivityCheckerImpl(ref.read(connectivityProvider));
