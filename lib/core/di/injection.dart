// lib/core/di/injection.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_event.dart';
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
  final dio = getIt<Dio>();

  dio.interceptors.clear();

  if (FlavorConfig.instance.useMockData) {
    dio.interceptors.add(MockInterceptor(useMockData: true));
  }

  if (FlavorConfig.instance.flavor != Flavor.production) {
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
  }

  // Auth interceptor with force logout wired to AuthBloc
  final authInterceptor = getIt<AuthInterceptor>();
  authInterceptor.onForceLogout = () {
    print('🔓 Force logout triggered from interceptor');
    if (getIt.isRegistered<AuthBloc>()) {
      getIt<AuthBloc>().add(const AuthEvent.logout());
    }
  };
  dio.interceptors.add(authInterceptor);

  dio.interceptors.add(getIt<ErrorInterceptor>());
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
