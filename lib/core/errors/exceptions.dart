class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode});
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.statusCode});
}

class CacheException extends AppException {
  const CacheException(super.message);
}

class AuthenticationException extends AppException {
  const AuthenticationException(super.message, {super.statusCode});
}

class ValidationException extends AppException {
  const ValidationException(super.message, {super.statusCode});
}

class TimeoutException extends AppException {
  const TimeoutException(super.message);
}

class NotFoundException extends AppException {
  const NotFoundException(super.message, {super.statusCode});
}
