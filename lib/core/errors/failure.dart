import 'package:equatable/equatable.dart';

import 'exception.dart';

sealed class Failure extends Equatable {
  final String message;
  final int? statusCode;
  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure({required super.message});
}

class RequestCancelledFailure extends Failure {
  const RequestCancelledFailure({required super.message});
}

class ParsingFailure extends Failure {
  const ParsingFailure({required super.message});
}

class StorageFailure extends Failure {
  const StorageFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
}

class ClientSideFailure extends Failure {
  const ClientSideFailure({required super.message, super.statusCode});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.message, super.statusCode});
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({required super.message, super.statusCode});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.message, super.statusCode});
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}

extension FailureMapping on AppException {
  Failure toFailure() => switch (this) {
    NetworkException e => NetworkFailure(message: e.message),
    RequestCancelledException e => RequestCancelledFailure(message: e.message),
    RequestTimeoutException e => RequestTimeoutFailure(message: e.message),
    StorageException e => StorageFailure(message: e.message),
    CacheException e => CacheFailure(message: e.message),
    ParsingException e => ParsingFailure(message: e.message),

    UnauthorizedException e => UnauthorizedFailure(
      message: e.message,
      statusCode: e.statusCode,
    ),
    NotFoundException e => NotFoundFailure(
      message: e.message,
      statusCode: e.statusCode,
    ),
    ForbiddenException e => ForbiddenFailure(
      message: e.message,
      statusCode: e.statusCode,
    ),
    ClientSideException e => ClientSideFailure(
      message: e.message,
      statusCode: e.statusCode,
    ),

    ServerException e => ServerFailure(
      message: e.message,
      statusCode: e.statusCode,
    ),

    UnknownException e => UnknownFailure(message: e.message),
  };
}
