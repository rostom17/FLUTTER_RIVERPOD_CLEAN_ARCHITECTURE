import 'package:dio/dio.dart';

import '/core/errors/exception.dart';

class NetworkExecutor {
  Future<Response<T>> execute<T>({
    required Future<Response<T>> Function() request,
  }) async {
    try {
      return await request();
    } on DioException catch (e) {
      final error = e.error;
      throw (error is AppException) ? error : const UnknownException();
    } catch (_) {
      throw const UnknownException();
    }
  }
}
