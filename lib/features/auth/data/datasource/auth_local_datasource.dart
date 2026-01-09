import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../core/database/app_database.dart';
import '../models/user_model.dart';

/// Abstract class defining local data operations for auth
abstract class AuthLocalDataSource {
  /// Get cached user
  Future<UserModel?> getCachedUser();

  /// Cache user data
  Future<void> cacheUser(UserModel user);

  /// Delete cached user
  Future<void> deleteCachedUser();

  /// Check if user data exists in cache
  Future<bool> hasUser();

  /// Clear all auth cache
  Future<Either<Failure, void>> clearAuthCache();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseService databaseService;

  AuthLocalDataSourceImpl(this.databaseService);

  AppDatabase get _db => databaseService.database;

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final users = await _db.select(_db.users).get();

      if (users.isEmpty) {
        return null;
      }

      final user = users.first;
      return UserModel(
        id: user.uid,
        email: user.email,
        username: user.username,
        fullName: user.fullName,
        phoneNumber: user.phoneNumber,
        profilePicture: user.profilePicture,
        isEmailVerified: user.isEmailVerified,
        isPhoneVerified: user.isPhoneVerified,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
      );
    } catch (e) {
      print('❌ Error getting cached user: $e');
      return null;
    }
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      // Delete existing user first
      await _db.delete(_db.users).go();

      // Insert new user
      await _db
          .into(_db.users)
          .insert(
            UsersCompanion(
              uid: Value(user.id),
              email: Value(user.email),
              username: Value(user.username),
              fullName: Value(user.fullName),
              phoneNumber: Value(user.phoneNumber),
              profilePicture: Value(user.profilePicture),
              isEmailVerified: Value(user.isEmailVerified),
              isPhoneVerified: Value(user.isPhoneVerified),
              createdAt: Value(user.createdAt),
              updatedAt: Value(user.updatedAt),
            ),
          );

      print('✅ User cached successfully');
    } catch (e) {
      print('❌ Error caching user: $e');
      throw CacheFailure('Failed to cache user: $e');
    }
  }

  @override
  Future<void> deleteCachedUser() async {
    try {
      await _db.delete(_db.users).go();
      print('✅ Cached user deleted');
    } catch (e) {
      print('❌ Error deleting cached user: $e');
      throw CacheFailure('Failed to delete cached user: $e');
    }
  }

  @override
  Future<bool> hasUser() async {
    try {
      final count = await _db
          .select(_db.users)
          .get()
          .then((users) => users.length);
      return count > 0;
    } catch (e) {
      print('❌ Error checking user existence: $e');
      return false;
    }
  }

  @override
  Future<Either<Failure, void>> clearAuthCache() async {
    try {
      await _db.transaction(() async {
        await _db.delete(_db.users).go();
        await _db.delete(_db.authTokens).go();
      });
      print('🗑️ Auth cache cleared');
      return const Right(null);
    } catch (e) {
      print('❌ Error clearing auth cache: $e');
      return Left(CacheFailure('Failed to clear auth cache: $e'));
    }
  }
}
