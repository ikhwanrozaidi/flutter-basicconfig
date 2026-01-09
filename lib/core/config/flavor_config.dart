// lib/core/config/flavor_config.dart

enum Flavor { development, staging, production }

class FlavorConfig {
  static FlavorConfig? _instance;
  static FlavorConfig get instance => _instance!;

  final Flavor flavor;
  final String appTitle;
  final String apiBaseUrl;
  final bool debugShowCheckedModeBanner;
  final bool useMockData;

  FlavorConfig({
    required this.flavor,
    required this.appTitle,
    required this.apiBaseUrl,
    required this.debugShowCheckedModeBanner,
    this.useMockData = false,
  }) {
    _instance = this;
  }

  // Factory constructors for each flavor
  factory FlavorConfig.development() => FlavorConfig(
    flavor: Flavor.development,
    appTitle: 'Gatepay Dev',
    apiBaseUrl: 'https://secure.gatepay.dev',
    debugShowCheckedModeBanner: true,
    useMockData: true, // Enable mock data in development
  );

  factory FlavorConfig.staging() => FlavorConfig(
    flavor: Flavor.staging,
    appTitle: 'Gatepay Staging',
    apiBaseUrl: 'https://secure.gatepay.dev',
    debugShowCheckedModeBanner: true,
    useMockData: false, // Use real API in staging
  );

  factory FlavorConfig.production() => FlavorConfig(
    flavor: Flavor.production,
    appTitle: 'Gatepay',
    apiBaseUrl: 'https://secure.gatepay.dev',
    debugShowCheckedModeBanner: false,
    useMockData: false, // Use real API in production
  );

  // Helper getters
  bool get isDevelopment => flavor == Flavor.development;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProduction => flavor == Flavor.production;

  static String get flavorName => _instance?.flavor.name ?? 'unknown';
}
