import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final Logger _logger;

  const LoggerInterceptor(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String message =
        '''
      ~~~~~~~~~~~~~~~~~~~~~~~~~~REQUEST~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      uri: ${options.uri},
      baseUrl: ${options.baseUrl},
      path: ${options.path}
      headers: ${options.headers},
      data: ${options.data},
      connection type: ${options.contentType},
      validation status : ${options.validateStatus},
      query params: ${options.queryParameters}
      ~~~~~~~~~~~~~~~~~~~~~~END of REQUEST MESSAGE~~~~~~~~~~~~~~~~~~~~~~~~
      ''';

    _logger.d(message);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    String message =
        '''
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~RESPONSE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      status code: ${response.statusCode},
      status message: ${response.statusMessage},
      real uri: ${response.realUri},
      headers: ${response.headers},
      request options: ${response.requestOptions}
      response data: ${response.data},
      ~~~~~~~~~~~~~~~~~~~END of RESPONSE MESSAGE~~~~~~~~~~~~~~~~~~~~~~~~~
    ''';

    _logger.d(message);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message =
        ''' 
      ~~~~~~~~~~~~~~~~~~~~~~~~~~ERROR MESSAGE~~~~~~~~~~~~~~~~~~~~~~~~~~
      error name: ${err.error},
      error message: ${err.message},
      error type: ${err.type}
      respoense : ${err.response},
      stack tace : ${err.stackTrace},
      req options : ${err.requestOptions}
      ~~~~~~~~~~~~~~~~~~~~~~~~END of ERROR MESSAGE~~~~~~~~~~~~~~~~~~~~~~~~~
    ''';

    _logger.e(message);
    super.onError(err, handler);
  }
}
