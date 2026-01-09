// lib/core/network/auth_interceptor.dart

import 'package:dio/dio.dart';
import '../service/secure_storage_service.dart';

/// Handles authentication token injection and automatic token refresh
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final SecureStorageService _secureStorage;
  bool _isRefreshing = false;
  final List<RequestOptions> _requestsQueue = [];

  AuthInterceptor(this._dio, this._secureStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip token for login/register/refresh endpoints
    if (_shouldSkipAuth(options.path)) {
      return handler.next(options);
    }

    try {
      final accessToken = await _secureStorage.getAccessToken();

      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
        print('🔐 Access token added to request: ${options.path}');
      } else {
        print('⚠️ No access token available for: ${options.path}');
      }
    } catch (e) {
      print('❌ Error getting access token: $e');
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if error is 401 (Unauthorized)
    if (err.response?.statusCode == 401) {
      print('🔄 401 Unauthorized - attempting token refresh');

      final errorData = err.response?.data;
      final isTokenExpired =
          errorData is Map &&
          (errorData['errorCode'] == 'TOKEN_EXPIRED' ||
              errorData['message']?.toString().toLowerCase().contains(
                    'expired',
                  ) ==
                  true);

      if (isTokenExpired) {
        // Try to refresh the token
        final newToken = await _refreshToken();

        if (newToken != null) {
          // Retry the original request with new token
          print('✅ Token refreshed successfully, retrying request');
          final retryResponse = await _retryRequest(
            err.requestOptions,
            newToken,
          );
          return handler.resolve(retryResponse);
        } else {
          print('❌ Token refresh failed - user needs to login again');
          // Token refresh failed - clear tokens and reject
          await _secureStorage.clearTokens();
          return handler.reject(err);
        }
      }
    }

    // For other errors, pass through
    handler.next(err);
  }

  /// Refresh the access token using refresh token
  Future<String?> _refreshToken() async {
    if (_isRefreshing) {
      // Already refreshing, wait and return
      print('⏳ Token refresh already in progress');
      return null;
    }

    try {
      _isRefreshing = true;

      final refreshToken = await _secureStorage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        print('❌ No refresh token available');
        return null;
      }

      print('🔄 Attempting to refresh token...');

      // Create a new Dio instance to avoid interceptor loop
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
        final data = response.data;

        // Handle both direct data and wrapped response
        final responseData = data['data'] ?? data;

        final newAccessToken = responseData['accessToken'] as String?;
        final newRefreshToken = responseData['refreshToken'] as String?;

        if (newAccessToken != null) {
          // Save new tokens
          await _secureStorage.saveAccessToken(newAccessToken);
          if (newRefreshToken != null) {
            await _secureStorage.saveRefreshToken(newRefreshToken);
          }

          print('✅ Token refresh successful');
          return newAccessToken;
        }
      }

      print('❌ Token refresh failed - invalid response');
      return null;
    } catch (e) {
      print('❌ Token refresh error: $e');
      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  /// Retry the original request with new token
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

  /// Check if request should skip authentication
  bool _shouldSkipAuth(String path) {
    final skipPaths = [
      '/auth/login',
      '/auth/register',
      '/auth/refresh',
      '/auth/request-otp',
      '/auth/verify-otp',
    ];

    return skipPaths.any((skipPath) => path.contains(skipPath));
  }
}
