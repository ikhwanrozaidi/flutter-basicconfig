// lib/core/network/dio_client.dart

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../mocks/mock_interceptor.dart';
import '../config/flavor_config.dart';
import '../service/secure_storage_service.dart';
import 'auth_interceptor.dart';
import 'error_interceptor.dart';

/// DioClient is the central configuration hub for all HTTP requests
///
/// Responsibilities:
/// 1. Configure Dio with base URL, timeouts, headers
/// 2. Add interceptors in correct order (Mock → Auth → Error → Logging)
/// 3. Manage mock vs real API mode based on flavor
///
/// This class ensures all API services use the same configured Dio instance
@injectable
class DioClient {
  final Dio _dio;
  final SecureStorageService _secureStorage;
  final bool useMockData;

  DioClient(this._dio, this._secureStorage, {@factoryParam bool? useMockData})
    : useMockData = useMockData ?? FlavorConfig.instance.useMockData {
    _configureDio();
  }

  /// Get the configured Dio instance
  /// API services will use this instance
  Dio get dio => _dio;

  /// Configure Dio with base options and interceptors
  void _configureDio() {
    // ==================== BASE OPTIONS ====================
    _dio.options = BaseOptions(
      baseUrl: FlavorConfig.instance.apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      // Follow redirects
      followRedirects: true,
      maxRedirects: 5,
      // Validate status code
      validateStatus: (status) {
        // Accept all status codes so we can handle them in interceptors
        return status != null && status < 500;
      },
    );

    // ==================== CLEAR EXISTING INTERCEPTORS ====================
    // Important: Clear any existing interceptors to avoid duplicates
    _dio.interceptors.clear();

    // ==================== ADD INTERCEPTORS IN ORDER ====================
    // ORDER MATTERS! Interceptors run in the order they're added

    // 1. MOCK INTERCEPTOR (First - intercepts requests before they go out)
    if (useMockData) {
      print('🎭 Mock mode enabled - using mock data');
      _dio.interceptors.add(MockInterceptor(useMockData: true));
    }

    // 2. AUTH INTERCEPTOR (Adds tokens to requests, handles refresh)
    _dio.interceptors.add(AuthInterceptor(_dio, _secureStorage));

    // 3. ERROR INTERCEPTOR (Converts errors to our custom exceptions)
    _dio.interceptors.add(ErrorInterceptor());

    // 4. LOGGING INTERCEPTOR (Logs requests/responses - dev only)
    if (FlavorConfig.instance.flavor != Flavor.production) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          logPrint: (obj) => print('🌐 DIO: $obj'),
        ),
      );
    }

    print('✅ Dio configured');
    print('📍 Base URL: ${_dio.options.baseUrl}');
    print('🎭 Mock mode: $useMockData');
    print('🔧 Flavor: ${FlavorConfig.instance.flavor.name}');
  }

  /// Reconfigure Dio (useful for changing base URL or settings at runtime)
  void reconfigure({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) {
    if (baseUrl != null) {
      _dio.options.baseUrl = baseUrl;
      print('🔄 Dio base URL changed to: $baseUrl');
    }
    if (connectTimeout != null) {
      _dio.options.connectTimeout = connectTimeout;
    }
    if (receiveTimeout != null) {
      _dio.options.receiveTimeout = receiveTimeout;
    }
  }

  /// Get current configuration info
  Map<String, dynamic> getConfig() {
    return {
      'baseUrl': _dio.options.baseUrl,
      'connectTimeout': _dio.options.connectTimeout?.inSeconds,
      'receiveTimeout': _dio.options.receiveTimeout?.inSeconds,
      'headers': _dio.options.headers,
      'useMockData': useMockData,
      'flavor': FlavorConfig.instance.flavor.name,
    };
  }
}
