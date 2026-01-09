import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_tokens.dart';
import '../entities/user_entity.dart';

/// Abstract repository defining auth operations
/// Implementation will be in data layer
abstract class AuthRepository {
  /// Request OTP for phone number
  Future<Either<Failure, String>> requestOtp(String phoneNumber);

  /// Verify OTP and login
  Future<Either<Failure, UserEntity>> verifyOtp(String phoneNumber, String otp);

  /// Login with email and password
  Future<Either<Failure, UserEntity>> login(String email, String password);

  /// Logout user
  Future<Either<Failure, void>> logout();

  /// Get current authenticated user
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Check if user is authenticated
  Future<Either<Failure, bool>> isAuthenticated();

  /// Get stored auth tokens
  Future<Either<Failure, AuthTokens?>> getAuthTokens();

  /// Clear auth cache (local data)
  Future<Either<Failure, void>> clearAuthCache();
}
