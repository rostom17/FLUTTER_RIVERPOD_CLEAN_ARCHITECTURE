import 'package:dio/dio.dart';

import '/core/services/token_refresh_service.dart';
import '/core/services/token_service.dart';
import '/core/constants/api_constants.dart';

class AuthInterceptor extends Interceptor {
  final Dio _retryDio;
  final TokenService _tokenService;
  final TokenRefreshService _tokenRefreshService;

  const AuthInterceptor({
    required this._retryDio,
    required this._tokenService,
    required this._tokenRefreshService,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenService.getAccessToken();
    if (token != null) {
      options.headers[ApiConstants.authorizationHeader] =
          "${ApiConstants.bearer} $token";
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) => handler.next(response);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final alreadyRetried = err.requestOptions.extra['retried'] == true;
    if (err.response?.statusCode != 401 || alreadyRetried) {
      return handler.next(err);
    }

    final newAccessToken = await _tokenRefreshService.refresh();
    if (newAccessToken == null) {
      return handler.next(err);
    }

    final requestOptions = err.requestOptions;
    try {
      final response = await _retryDio.fetch(
        requestOptions.copyWith(
          headers: {
            ...requestOptions.headers,
            ApiConstants.authorizationHeader:
                "${ApiConstants.bearer} $newAccessToken",
          },
          extra: {...requestOptions.extra, 'retried': true},
        ),
      );
      return handler.resolve(response);
    } on DioException catch (retryError) {
      return handler.next(retryError);
    }
  }
}
