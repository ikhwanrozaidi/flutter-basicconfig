import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../domain/entities/auth_tokens.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../datasource/auth_local_datasource.dart';
import '../datasource/auth_remote_datasource.dart';
import '../models/user_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl
    with BaseOfflineSyncRepository<UserEntity, UserModel>
    implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final SecureStorageService secureStorage;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.secureStorage,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, String>> requestOtp(String phoneNumber) async {
    // Check network
    final hasConnection = await networkInfo.isConnected;
    if (!hasConnection) {
      return const Left(ConnectionFailure());
    }

    return await remoteDataSource.requestOtp(phoneNumber);
  }

  @override
  Future<Either<Failure, UserEntity>> verifyOtp(
    String phoneNumber,
    String otp,
  ) async {
    // Check network
    final hasConnection = await networkInfo.isConnected;
    if (!hasConnection) {
      return const Left(ConnectionFailure());
    }

    // Verify OTP with remote
    final result = await remoteDataSource.verifyOtp(phoneNumber, otp);

    return await result.fold((failure) => Left(failure), (authResponse) async {
      try {
        // Save tokens to secure storage
        await secureStorage.saveTokens(
          accessToken: authResponse.accessToken,
          refreshToken: authResponse.refreshToken,
        );

        // Save user ID
        await secureStorage.saveUserId(authResponse.user.id);

        // Cache user locally
        await localDataSource.cacheUser(authResponse.user);

        // Return user entity
        return Right(authResponse.user.toEntity());
      } catch (e) {
        return Left(CacheFailure('Failed to save auth data: $e'));
      }
    });
  }

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    // Check network
    final hasConnection = await networkInfo.isConnected;
    if (!hasConnection) {
      return const Left(ConnectionFailure());
    }

    // Login with remote
    final result = await remoteDataSource.login(email, password);

    return await result.fold((failure) => Left(failure), (authResponse) async {
      try {
        // Save tokens to secure storage
        await secureStorage.saveTokens(
          accessToken: authResponse.accessToken,
          refreshToken: authResponse.refreshToken,
        );

        // Save user ID
        await secureStorage.saveUserId(authResponse.user.id);

        // Cache user locally
        await localDataSource.cacheUser(authResponse.user);

        // Return user entity
        return Right(authResponse.user.toEntity());
      } catch (e) {
        return Left(CacheFailure('Failed to save auth data: $e'));
      }
    });
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // Try to logout from server (fire and forget)
      final hasConnection = await networkInfo.isConnected;
      if (hasConnection) {
        await remoteDataSource.logout();
      }

      // Clear local data regardless of remote result
      await secureStorage.clearTokens();
      await localDataSource.deleteCachedUser();

      return const Right(null);
    } catch (e) {
      return Left(UnexpectedFailure('Failed to logout: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    return await getOfflineFirst(
      getLocal: () async => await localDataSource.getCachedUser(),
      getRemote: () async => await remoteDataSource.getProfile(),
      saveLocal: (model) async => await localDataSource.cacheUser(model),
      toEntity: (model) => model.toEntity(),
      forceRefresh: false,
      cacheTimeout: const Duration(hours: 24),
    );
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    try {
      // Check if tokens exist
      final hasTokens = await secureStorage.hasValidTokens();

      if (!hasTokens) {
        return const Right(false);
      }

      // Check if user exists in cache
      final hasUser = await localDataSource.hasUser();

      return Right(hasUser);
    } catch (e) {
      return Left(UnexpectedFailure('Failed to check auth status: $e'));
    }
  }

  @override
  Future<Either<Failure, AuthTokens?>> getAuthTokens() async {
    try {
      final accessToken = await secureStorage.getAccessToken();
      final refreshToken = await secureStorage.getRefreshToken();

      if (accessToken == null || refreshToken == null) {
        return const Right(null);
      }

      return Right(
        AuthTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
          expiresIn: 300, // 5 minutes default
        ),
      );
    } catch (e) {
      return Left(CacheFailure('Failed to get tokens: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> clearAuthCache() async {
    return await localDataSource.clearAuthCache();
  }
}
