sealed class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException({required this.message, this.statusCode});

  @override
  String toString() => "Exception(statusCode: $statusCode): $message";
}

class NetworkException extends AppException {
  const NetworkException({
    super.message =
        "No internet! Please check your internet connection and try again.",
  });
}

class RequestTimeoutException extends AppException {
  const RequestTimeoutException({
    super.message = "Request timeout! Try again later.",
  });
}

class RequestCancelledException extends AppException {
  const RequestCancelledException({
    super.message = "Request cancelled! Try again.",
  });
}

class ParsingException extends AppException {
  const ParsingException({super.message = "Failed to parse server response!"});
}

class StorageException extends AppException {
  const StorageException({super.message = "Unable to access storage!"});
}

class CacheException extends AppException {
  const CacheException({super.message = "Failed to retrieve cache data!"});
}

class ServerException extends AppException {
  const ServerException({required super.message, super.statusCode});
}

class ClientSideException extends AppException {
  const ClientSideException({required super.message, super.statusCode});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({
    super.message = "Unauthorized! Please login again.",
    super.statusCode = 401,
  });
}

class ForbiddenException extends AppException {
  const ForbiddenException({
    super.message = "You don't have permission to perform this action.",
    super.statusCode = 403,
  });
}

class NotFoundException extends ClientSideException {
  const NotFoundException({
    super.message = "The requested resource couldn't be found.",
    super.statusCode = 404,
  });
}

class UnknownException extends AppException {
  const UnknownException({super.message = "An unknown error has occurred!"});
}
