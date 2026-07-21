import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/services/token_refresh_service.dart';
import '/core/network/dio_providers.dart';
import 'secure_storage.dart';
import 'token_service.dart';

part 'service_providers.g.dart';

@Riverpod(keepAlive: true)
Logger logger(Ref ref) => Logger(
  printer: kReleaseMode ? SimplePrinter() : PrettyPrinter(methodCount: 0),
  level: kReleaseMode ? Level.warning : Level.debug,
);

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) => SecureStorage.secureStorage;

@Riverpod(keepAlive: true)
TokenService tokenService(Ref ref) =>
    TokenServiceImpl(ref.read(secureStorageProvider));

@riverpod
TokenRefreshService tokenRefreshService(Ref ref) => TokenRefreshService(
  refreshDio: ref.read(refreshDioProvider),
  tokenService: ref.read(tokenServiceProvider),
  logger: ref.read(loggerProvider),
);
