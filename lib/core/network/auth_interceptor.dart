// lib/core/network/auth_interceptor.dart

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../service/secure_storage_service.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final SecureStorageService _secureStorage;

  // Refresh state management
  bool _isRefreshing = false;
  final List<_QueuedRequest> _requestsQueue = [];

  // Callback to notify app of forced logout
  void Function()? onForceLogout;

  AuthInterceptor(this._dio, this._secureStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_shouldSkipAuth(options.path)) {
      return handler.next(options);
    }

    try {
      final accessToken = await _secureStorage.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } catch (e) {
      print('❌ Error getting access token: $e');
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Only handle 401 Unauthorized
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // Don't try to refresh if the refresh endpoint itself failed
    if (err.requestOptions.path.contains('/auth/refresh')) {
      print('❌ Refresh token itself is invalid — forcing logout');
      await _forceLogout();
      return handler.reject(err);
    }

    // Don't try to refresh for login/register failures
    if (_shouldSkipAuth(err.requestOptions.path)) {
      return handler.next(err);
    }

    print('🔄 401 received — attempting token refresh');

    // If already refreshing, queue this request
    if (_isRefreshing) {
      print(
        '⏳ Refresh in progress — queuing request: ${err.requestOptions.path}',
      );
      final completer = Completer<Response>();
      _requestsQueue.add(
        _QueuedRequest(
          requestOptions: err.requestOptions,
          completer: completer,
        ),
      );

      try {
        final response = await completer.future;
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(
          DioException(requestOptions: err.requestOptions, error: e),
        );
      }
    }

    // Attempt refresh
    final newToken = await _refreshToken();

    if (newToken != null) {
      // Retry the original request
      print('✅ Token refreshed — retrying original request');
      try {
        final response = await _retryRequest(err.requestOptions, newToken);
        // Process queued requests with new token
        _processQueue(newToken);
        return handler.resolve(response);
      } catch (retryError) {
        _rejectQueue(retryError);
        return handler.reject(
          DioException(requestOptions: err.requestOptions, error: retryError),
        );
      }
    } else {
      // Refresh failed — force logout
      print('❌ Token refresh failed — forcing logout');
      _rejectQueue(err);
      await _forceLogout();
      return handler.reject(err);
    }
  }

  Future<String?> _refreshToken() async {
    if (_isRefreshing) return null;

    try {
      _isRefreshing = true;

      final refreshToken = await _secureStorage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        print('❌ No refresh token available');
        return null;
      }

      print('🔄 Calling refresh endpoint...');

      // Use a separate Dio instance to avoid interceptor loop
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: _dio.options.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      final response = await refreshDio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final responseData = response.data['data'] ?? response.data;
        final newAccessToken = responseData['accessToken'] as String?;
        final newRefreshToken = responseData['refreshToken'] as String?;

        if (newAccessToken != null) {
          await _secureStorage.saveAccessToken(newAccessToken);
          if (newRefreshToken != null) {
            await _secureStorage.saveRefreshToken(newRefreshToken);
          }
          print('✅ Tokens refreshed and saved');
          return newAccessToken;
        }
      }

      print('❌ Refresh response invalid');
      return null;
    } catch (e) {
      print('❌ Refresh request failed: $e');
      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Response> _retryRequest(
    RequestOptions requestOptions,
    String newToken,
  ) async {
    final options = Options(
      method: requestOptions.method,
      headers: {...requestOptions.headers, 'Authorization': 'Bearer $newToken'},
    );

    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  /// Retry all queued requests with the new token
  void _processQueue(String newToken) {
    print('🔄 Processing ${_requestsQueue.length} queued requests');
    for (final queued in _requestsQueue) {
      _retryRequest(queued.requestOptions, newToken)
          .then((response) => queued.completer.complete(response))
          .catchError((error) => queued.completer.completeError(error));
    }
    _requestsQueue.clear();
  }

  /// Reject all queued requests
  void _rejectQueue(Object error) {
    print('❌ Rejecting ${_requestsQueue.length} queued requests');
    for (final queued in _requestsQueue) {
      queued.completer.completeError(error);
    }
    _requestsQueue.clear();
  }

  /// Clear tokens and notify app to navigate to login
  Future<void> _forceLogout() async {
    await _secureStorage.clearTokens();
    _requestsQueue.clear();
    _isRefreshing = false;

    // Notify the app layer
    if (onForceLogout != null) {
      print('🔓 Triggering force logout callback');
      onForceLogout!();
    }
  }

  bool _shouldSkipAuth(String path) {
    const skipPaths = [
      '/auth/login',
      '/auth/register',
      '/auth/refresh',
      '/auth/request-otp',
      '/auth/verify-otp',
    ];
    return skipPaths.any((skipPath) => path.contains(skipPath));
  }
}

class _QueuedRequest {
  final RequestOptions requestOptions;
  final Completer<Response> completer;

  _QueuedRequest({required this.requestOptions, required this.completer});
}
