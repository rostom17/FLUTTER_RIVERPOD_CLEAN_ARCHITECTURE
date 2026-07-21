import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '/core/constants/api_constants.dart';
import '/core/services/token_service.dart';

/// Performs an authentication token refresh request.
/// Called by "../core/network/interceptors/auth_interceptor.dart"
///
/// This method is typically called when an API request fails with a 401 Unauthorized status.
/// It uses the current ``refreshToken`` to obtain a new pair of access and refresh tokens.
///
/// **Request Configuration:**
/// - **Endpoint:** This method must call [_refreshDio.post] with the correct endpoint path.
///   Ensure the path matches your API specification (e.g., "/auth/refresh").
///
/// **Request Body:**
/// - The request must contain a JSON body with correct key ``"refreshToken"`` and value ``"refreshTokenValue"```
///   Please verify the exact key name (e.g., `'refresh_token'`) against your API documentation.
///
/// **Response Handling:**
/// - Upon a successful response, extract the new tokens using the JSON keys provided by
///   your API (e.g., ``"accessToken"`` and ``"refreshToken"``).
/// - The extracted ``newAccessToken`` and ``newRefreshToken`` should then be persisted locally
///   for subsequent API calls.
///

class TokenRefreshService {
  final Dio _refreshDio;
  final TokenService _tokenService;
  final Logger _logger;

  Future<String?>? _refreshFuture;

  TokenRefreshService({
    required this._refreshDio,
    required this._tokenService,
    required this._logger,
  });

  Future<String?> refresh() {
    _refreshFuture ??= _doRefresh();
    return _refreshFuture!.whenComplete(() => _refreshFuture = null);
  }

  Future<String?> _doRefresh() async {
    final refreshToken = await _tokenService.getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final response = await _refreshDio.post(
        //TODO: Make sure to put right path
        ApiConstants.refresh,
        data: {"refreshToken": refreshToken},
      );

      final data = response.data;
      if (data is! Map) return null;

      //TODO: Change might be needed according to API response
      final newAccessToken = data["accessToken"] as String?;
      final newRefreshToken = data["refreshToken"] as String?;
      if (newAccessToken == null) return null;

      await Future.wait([
        _tokenService.saveAccessToken(newAccessToken),
        if (newRefreshToken != null)
          _tokenService.saveRefreshToken(newRefreshToken),
      ]);

      return newAccessToken;
    } on DioException catch (e, st) {
      final isAuthFailure =
          e.response?.statusCode == 401 || e.response?.statusCode == 403;
      if (isAuthFailure) {
        await _tokenService.deleteAllTokens();
      } else {
        _logger.w(
          "Refresh failed transiently, keeping tokens",
          error: e,
          stackTrace: st,
        );
      }
      return null;
    } catch (e, st) {
      _logger.e(
        "Unexpected error during token refresh",
        error: e,
        stackTrace: st,
      );
      return null;
    }
  }
}
