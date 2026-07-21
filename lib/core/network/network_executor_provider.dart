import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/network/network_executor.dart';

part 'network_executor_provider.g.dart';

@Riverpod(keepAlive: true)
NetworkExecutor networkExecutor(Ref ref) => NetworkExecutor();
