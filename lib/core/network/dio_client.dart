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
    _dio.options = BaseOptions(
      baseUrl: FlavorConfig.instance.apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      followRedirects: true,
      maxRedirects: 5,
      validateStatus: (status) => status != null && status < 500,
    );
    // Interceptors are configured in injection.dart — don't add them here
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
