import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

// Network failures
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.statusCode});
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.statusCode});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super('No internet connection');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('Request timeout');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Unauthorized access', statusCode: 401);
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure() : super('Access forbidden', statusCode: 403);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super('Resource not found', statusCode: 404);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message) : super(statusCode: 422);
}

// Cache failures
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

// Authentication failures
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message, {super.statusCode});
}

// Unexpected failures
class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message, {super.statusCode});
}
