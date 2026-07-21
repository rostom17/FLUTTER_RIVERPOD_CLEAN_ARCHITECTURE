import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/services/service_providers.dart';
import '/core/network/dio_providers.dart';
import '/core/network/interceptors/auth_interceptor.dart';
import '/core/network/interceptors/error_interceptor.dart';
import '/core/network/interceptors/logger_interceptor.dart';

part 'interceptor_providers.g.dart';

@Riverpod(keepAlive: true)
LoggerInterceptor loggerInterceptor(Ref ref) =>
    LoggerInterceptor(ref.read(loggerProvider));

@Riverpod(keepAlive: true)
ErrorInterceptor errorInterceptor(Ref ref) =>
    ErrorInterceptor(ref.read(loggerProvider));

@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(Ref ref) => AuthInterceptor(
  retryDio: ref.read(retryDioProvider),
  tokenService: ref.read(tokenServiceProvider),
  tokenRefreshService: ref.read(tokenRefreshServiceProvider),
);
