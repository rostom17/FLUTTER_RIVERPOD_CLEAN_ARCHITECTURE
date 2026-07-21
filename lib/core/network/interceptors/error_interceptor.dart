import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '/core/errors/exception.dart';

class ErrorInterceptor extends Interceptor {
  final Logger _logger;

  const ErrorInterceptor(this._logger);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _mapDioException(err);

    if (kDebugMode) {
      _logger.e(
        'Error-Interceptor: HTTP ERROR',
        error: exception,
        stackTrace: err.stackTrace,
        time: DateTime.now(),
      );

      _logger.d({
        'type': err.type.name,
        'method': err.requestOptions.method,
        'path': err.requestOptions.path,
        'statusCode': err.response?.statusCode,
        'query': err.requestOptions.queryParameters,
        'data': err.requestOptions.data,
        'response': err.response?.data,
        'message': exception.message,
      });
    }

    handler.next(err.copyWith(error: exception));
  }

  AppException _mapDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionError:
        return NetworkException();

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const RequestTimeoutException();

      case DioExceptionType.cancel:
        return const RequestCancelledException();

      case DioExceptionType.badResponse:
        return _handleBadResponse(dioException.response);

      case DioExceptionType.unknown:
      default:
        return UnknownException(
          message:
              dioException.message ?? "An unknown dio exception has occurred!",
        );
    }
  }

  AppException _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode;
    final message = _extractMessage(response?.data);

    if (statusCode == null) {
      return const UnknownException();
    }

    if (statusCode >= 400 && statusCode <= 500) {
      switch (statusCode) {
        case 400:
          return _clientSideException(
            message ?? "The request couldn't be processed.",
            statusCode,
          );
        case 401:
          return const UnauthorizedException();
        case 403:
          return const ForbiddenException();
        case 404:
          return const NotFoundException();
        case 408:
          return const RequestTimeoutException();
        case 422:
          return _clientSideException(
            message ??
                "Some information is invalid. Please review and try again.",
            422,
          );
        case 429:
          return _clientSideException(
            "Too many requests. Please wait a moment and try again.",
            429,
          );
        default:
          return _clientSideException(
            "The request couldn't be completed.",
            statusCode,
          );
      }
    }

    if (statusCode >= 500) {
      switch (statusCode) {
        case 500:
          return _serverException(
            "Internal server error. Please try again later",
            500,
          );
        case 502:
          return _serverException(
            "The server is temporarily unavailable. Please try again later.",
            502,
          );
        case 503:
          return _serverException(
            "The service is temporarily unavailable. Please try again later.",
            503,
          );
        case 504:
          return _serverException(
            "The server took too long to respond. Please try again.",
            504,
          );
        default:
          return _serverException(
            message ??
                "The server encountered an error. Please try again later.",
            statusCode,
          );
      }
    }
    return UnknownException(message: message ?? "Something went wrong!");
  }

  ServerException _serverException(String message, int? code) =>
      ServerException(message: message, statusCode: code);

  ClientSideException _clientSideException(String message, int? code) =>
      ClientSideException(message: message, statusCode: code);

  String? _extractMessage(dynamic data) {
    if (data == null) return null;

    if (data is Map) {
      final msg = data["message"] ?? data["error"] ?? data["detail"];
      final str = msg?.toString().trim();
      if (str != null && str.isNotEmpty) return str;

      if (data['errors'] is List) {
        return (data['errors'] as List).join(', ');
      }
    }

    return data.toString();
  }
}
