// lib/core/di/injection.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../mocks/mock_interceptor.dart';
import '../config/flavor_config.dart';
import '../constant/app_constants.dart';
import '../network/auth_interceptor.dart';
import '../network/error_interceptor.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

// Track initialization state
bool _isInitialized = false;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  // Prevent multiple initializations
  if (_isInitialized) {
    return;
  }

  try {
    // In development, reset GetIt to handle hot reload
    if (FlavorConfig.instance.isDevelopment && getIt.isRegistered<Dio>()) {
      await getIt.reset();
      _isInitialized = false; // Reset the flag as well
    }

    getIt.init();
    _configureDioInterceptors();
    _isInitialized = true;

    print('✅ Dependency injection configured successfully');
  } catch (e) {
    print('❌ Error configuring dependencies: $e');

    // If there's an error, try to reset and retry once
    if (!_isInitialized) {
      try {
        await getIt.reset();
        getIt.init();
        _configureDioInterceptors();
        _isInitialized = true;
        print('✅ Dependency injection configured on retry');
      } catch (retryError) {
        print('❌ Failed to configure dependencies on retry: $retryError');
        rethrow;
      }
    } else {
      rethrow;
    }
  }
}

void _configureDioInterceptors() {
  try {
    final dio = getIt<Dio>();

    print('');
    print('═══════════════════════════════════════');
    print('🔧 CONFIGURING DIO INTERCEPTORS');
    print('═══════════════════════════════════════');
    print('🔧 Flavor: ${FlavorConfig.instance.flavor.name}');
    print('🎭 Mock Mode: ${FlavorConfig.instance.useMockData}');
    print('📍 Base URL: ${FlavorConfig.instance.apiBaseUrl}');
    print('═══════════════════════════════════════');
    print('');

    // Clear any existing interceptors
    dio.interceptors.clear();
    print('🧹 Cleared existing interceptors');

    // ==================== INTERCEPTOR ORDER ====================
    // 1. MOCK INTERCEPTOR (First - intercepts requests in dev)
    // 2. PRETTY LOGGER (Second - logs requests/responses in dev)
    // 3. AUTH INTERCEPTOR (Third - adds tokens, handles refresh)
    // 4. ERROR INTERCEPTOR (Last - handles errors)
    // ===========================================================

    // 1. Add Mock Interceptor (FIRST - only in development with mock enabled)
    if (FlavorConfig.instance.useMockData) {
      print('🎭 Adding Mock Interceptor');
      dio.interceptors.add(MockInterceptor(useMockData: true));
      print('✅ Mock Interceptor added');
    }

    // 2. Add pretty logging (only in debug mode) for API debug
    if (FlavorConfig.instance.flavor != Flavor.production) {
      print('📝 Adding Pretty Logger');
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
      print('✅ Pretty Logger added');
    }

    // 3. Add auth interceptor
    print('🔐 Adding Auth Interceptor');
    dio.interceptors.add(getIt<AuthInterceptor>());
    print('✅ Auth Interceptor added');

    // 4. Add error handling interceptor
    print('❌ Adding Error Interceptor');
    dio.interceptors.add(getIt<ErrorInterceptor>());
    print('✅ Error Interceptor added');

    print('');
    print('✅ Dio interceptors configured successfully');
    print('📊 Total interceptors: ${dio.interceptors.length}');
    print('');
  } catch (e) {
    print('❌ Error configuring Dio interceptors: $e');
    rethrow;
  }
}

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    print('🔧 RegisterModule: Creating Dio instance...');
    final dio = Dio(
      BaseOptions(
        baseUrl: FlavorConfig.instance.apiBaseUrl,
        connectTimeout: const Duration(
          milliseconds: AppConstants.connectionTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: AppConstants.receiveTimeout,
        ),
        sendTimeout: const Duration(milliseconds: AppConstants.sendTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    print('✅ RegisterModule: Dio instance created successfully');
    return dio;
  }

  @lazySingleton
  Connectivity get connectivity {
    print('🔧 RegisterModule: Creating Connectivity instance...');
    try {
      final conn = Connectivity();
      print('✅ RegisterModule: Connectivity instance created successfully');
      return conn;
    } catch (e, stackTrace) {
      print('❌ RegisterModule: Error creating Connectivity instance: $e');
      print('❌ RegisterModule: Stack trace: $stackTrace');
      rethrow;
    }
  }

  @lazySingleton
  FlutterSecureStorage get secureStorage {
    print('🔧 RegisterModule: Creating FlutterSecureStorage instance...');
    try {
      const storage = FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );
      print('✅ RegisterModule: FlutterSecureStorage instance created');
      return storage;
    } catch (e, stackTrace) {
      print('❌ RegisterModule: Error creating FlutterSecureStorage: $e');
      print('❌ RegisterModule: Stack trace: $stackTrace');
      rethrow;
    }
  }
}
