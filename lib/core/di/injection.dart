// lib/core/di/injection.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../config/flavor_config.dart';

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
      _isInitialized = false;
    }

    await getIt.init();
    _isInitialized = true;

    print('✅ Dependency injection configured successfully');
  } catch (e) {
    print('❌ Error configuring dependencies: $e');

    // If there's an error, try to reset and retry once
    if (!_isInitialized) {
      try {
        await getIt.reset();
        await getIt.init();
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

/// Register module for third-party dependencies
@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
}
