import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../errors/failures.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Failure failure;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        failure = const TimeoutFailure();
        break;

      case DioExceptionType.connectionError:
        failure = const ConnectionFailure();
        break;

      case DioExceptionType.badResponse:
        failure = _handleStatusError(
          err.response?.statusCode,
          err.response?.data,
        );
        break;

      case DioExceptionType.cancel:
        failure = const ServerFailure('Request was cancelled');
        break;

      case DioExceptionType.badCertificate:
        failure = const NetworkFailure('SSL certificate error');
        break;

      default:
        failure = ServerFailure(
          'Network error: ${err.message ?? 'Unknown error'}',
        );
    }

    // Create a new DioException with the failure
    final newError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: failure,
      message: failure.message,
    );

    handler.next(newError);
  }

  Failure _handleStatusError(int? statusCode, dynamic data) {
    String message = 'An error occurred';

    // Extract message from response if available
    if (data is Map<String, dynamic> && data['message'] != null) {
      message = data['message'].toString();
    }

    switch (statusCode) {
      case 400:
        return ValidationFailure(message);
      case 401:
        return const UnauthorizedFailure();
      case 403:
        return const ForbiddenFailure();
      case 404:
        return const NotFoundFailure();
      case 422:
        return ValidationFailure(message);
      case 500:
      case 502:
      case 503:
        return ServerFailure(message, statusCode: statusCode);
      default:
        return ServerFailure(message, statusCode: statusCode);
    }
  }
}
