// lib/core/repositories/base_sync_repository.dart

import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Base class for offline-first operations
/// This is a MIXIN, not a class to extend
mixin BaseOfflineSyncRepository<T, M> {
  /// Get operation - offline first
  ///
  /// Flow:
  /// 1. Check local cache first
  /// 2. If valid cache exists and not forcing refresh → return cached data
  /// 3. Try remote fetch
  /// 4. If remote succeeds → save locally and return
  /// 5. If remote fails → fallback to cached data if available
  ///
  /// Parameters:
  /// - [getLocal]: Function to retrieve data from local database (returns Model)
  /// - [getRemote]: Function to retrieve data from remote API (returns Either<Failure, Model>)
  /// - [saveLocal]: Function to save data to local database
  /// - [toEntity]: Function to convert Model to Entity
  /// - [forceRefresh]: Skip cache and force remote fetch
  /// - [cacheTimeout]: How long cache is considered valid
  Future<Either<Failure, T>> getOfflineFirst({
    required Future<M?> Function() getLocal,
    required Future<Either<Failure, M>> Function() getRemote,
    required Future<void> Function(M model) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    try {
      // Step 1: Check local cache first - get model from cache
      final localModel = await getLocal();

      if (localModel != null && !forceRefresh) {
        // Convert model to entity for cache validation
        final localEntity = toEntity(localModel);
        if (_isCacheValid(localEntity, cacheTimeout)) {
          print('📦 Using cached data');
          return Right(localEntity);
        } else {
          print('⏰ Cache expired, fetching fresh data');
        }
      } else if (localModel == null) {
        print('📭 No cached data found');
      }

      // Step 2: Try remote fetch
      try {
        print('🌐 Fetching from remote...');
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            // Remote fetch failed - fallback to local if available
            if (localModel != null) {
              print('⚠️ Remote failed, using stale cache as fallback');
              return Right(toEntity(localModel));
            }
            print('❌ Remote failed and no cache available');
            return Left(failure);
          },
          (remoteModel) async {
            // Remote fetch succeeded
            print('✅ Remote fetch successful, saving to cache');
            final entity = toEntity(remoteModel);

            // Save model to local database
            await saveLocal(remoteModel);

            return Right(entity);
          },
        );
      } catch (e) {
        // Network error or exception - fallback to local
        if (localModel != null) {
          print('⚠️ Network error, using stale cache as fallback');
          return Right(toEntity(localModel));
        }
        return const Left(ConnectionFailure());
      }
    } catch (e) {
      print('❌ Error in getOfflineFirst: $e');
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// Check if cached entity is still valid based on timeout
  bool _isCacheValid(T entity, Duration? cacheTimeout) {
    if (cacheTimeout == null) return true;

    try {
      // Try to get updatedAt from entity
      final dynamic e = entity;
      if (e.updatedAt is DateTime) {
        final age = DateTime.now().difference(e.updatedAt as DateTime);
        final isValid = age < cacheTimeout;
        print('📅 Cache age: ${age.inMinutes} minutes, valid: $isValid');
        return isValid;
      }
    } catch (_) {
      // If entity doesn't have updatedAt, consider cache valid
    }

    return true;
  }
}
