// lib/core/constants/app_constants.dart

class AppConstants {
  // App Info
  static const String appName = 'Flutter Basic Config';
  static const String appVersion = '1.0.0';

  // API Timeouts (in milliseconds)
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int sendTimeout = 30000; // 30 seconds

  // API
  static const int apiRetryAttempts = 3;

  // Cache
  static const Duration defaultCacheTimeout = Duration(hours: 1);
  static const Duration shortCacheTimeout = Duration(minutes: 15);
  static const Duration longCacheTimeout = Duration(days: 1);

  // Pagination
  static const int defaultPageSize = 10;
  static const int maxPageSize = 100;

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 30;
  static const int otpLength = 6;

  // UI
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  // Storage Keys (for SharedPreferences - NOT secure data)
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  static const String onboardingCompleteKey = 'onboarding_complete';
}
