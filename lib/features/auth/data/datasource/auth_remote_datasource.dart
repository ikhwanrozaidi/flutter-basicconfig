import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failures.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';
import '../models/user_model.dart';
import 'auth_api_service.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, String>> requestOtp(String phoneNumber);
  Future<Either<Failure, AuthResponseModel>> verifyOtp(
    String phoneNumber,
    String otp,
  );
  Future<Either<Failure, AuthResponseModel>> login(
    String email,
    String password,
  );
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserModel>> getProfile();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, String>> requestOtp(String phoneNumber) async {
    try {
      final request = OtpRequestModel(phoneNumber: phoneNumber);
      final response = await apiService.requestOtp(request);

      if (response.isSuccess) {
        return Right(response.message);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnexpectedFailure('Failed to request OTP: $e'));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> verifyOtp(
    String phoneNumber,
    String otp,
  ) async {
    try {
      final request = VerifyOtpRequestModel(phoneNumber: phoneNumber, otp: otp);
      final response = await apiService.verifyOtp(request);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnexpectedFailure('Failed to verify OTP: $e'));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final request = LoginRequestModel(email: email, password: password);
      final response = await apiService.login(request);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnexpectedFailure('Failed to login: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await apiService.logout();

      if (response.isSuccess) {
        return const Right(null);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnexpectedFailure('Failed to logout: $e'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    try {
      final response = await apiService.getProfile();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnexpectedFailure('Failed to get profile: $e'));
    }
  }

  /// Handle DioException and convert to Failure
  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        String message = 'Server error';

        // Try to extract message from response
        if (data is Map<String, dynamic>) {
          message = data['message'] ?? message;
        }

        switch (statusCode) {
          case 400:
            return ValidationFailure(message);
          case 401:
            return AuthenticationFailure(message, statusCode: 401);
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

      case DioExceptionType.cancel:
        return const ServerFailure('Request cancelled');

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return const ConnectionFailure();

      default:
        return UnexpectedFailure('Unexpected error: ${error.message}');
    }
  }
}
