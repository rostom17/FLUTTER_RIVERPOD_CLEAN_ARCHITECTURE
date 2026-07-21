import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/constants/api_constants.dart';
import '/core/network/interceptors/interceptor_providers.dart';

part 'dio_providers.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) => createDio([
  ref.read(loggerInterceptorProvider),
  ref.read(authInterceptorProvider),
  ref.read(errorInterceptorProvider),
]);

@riverpod
Dio refreshDio(Ref ref) => createDio([ref.read(loggerInterceptorProvider)]);

@riverpod
Dio retryDio(Ref ref) => createDio([ref.read(loggerInterceptorProvider)]);

final options = BaseOptions(
  baseUrl: ApiConstants.baseUrl,
  contentType: ApiConstants.contentTypeHeader,
  connectTimeout: ApiConstants.connectionTimeout,
  sendTimeout: ApiConstants.sendTimeout,
  receiveTimeout: ApiConstants.receiveTimeout,
  headers: {ApiConstants.acceptHeader: ApiConstants.json},
);

Dio createDio([List<Interceptor> interceptors = const []]) {
  final dio = Dio(options);
  dio.interceptors.addAll(interceptors);
  return dio;
}
