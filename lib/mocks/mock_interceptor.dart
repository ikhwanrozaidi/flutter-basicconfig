import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

/// Mock interceptor for testing without real backend
/// Serves JSON files from assets based on API endpoints
class MockInterceptor extends Interceptor {
  final bool useMockData;
  DateTime? _loginTime;
  int _requestCount = 0;

  // Mock credentials for testing
  static const String mockEmail = 'demo@example.com';
  static const String mockPassword = 'password123';
  static const String mockPhone = '+60123456789';
  static const String mockOtp = '123456';

  MockInterceptor({this.useMockData = false});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!useMockData) {
      return handler.next(options);
    }

    print('🎭 MOCK: ${options.method} ${options.path}');

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    try {
      final mockResponse = await _getMockResponse(options);
      return handler.resolve(mockResponse);
    } catch (e) {
      print('❌ MOCK ERROR: $e');
      return handler.reject(
        DioException(
          requestOptions: options,
          error: e,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  Future<Response> _getMockResponse(RequestOptions options) async {
    final path = options.path;
    final method = options.method;

    // Increment request count for token expiration simulation
    if (!path.contains('/auth/refresh')) {
      _requestCount++;
    }

    // ==================== AUTH ENDPOINTS ====================

    // Login with email/password
    if (path.contains('/auth/login') && method == 'POST') {
      return await _handleLogin(options);
    }

    // Request OTP
    if (path.contains('/auth/request-otp') && method == 'POST') {
      return await _handleRequestOtp(options);
    }

    // Verify OTP
    if (path.contains('/auth/verify-otp') && method == 'POST') {
      return await _handleVerifyOtp(options);
    }

    // Logout
    if (path.contains('/auth/logout') && method == 'POST') {
      _loginTime = null;
      _requestCount = 0;
      return await _loadMockJson(
        'lib/core/mocks/auth/logout_response.json',
        options,
      );
    }

    // Get Profile
    if (path.contains('/auth/profile') && method == 'GET') {
      // Simulate token expiration after 10 requests or 5 minutes
      if (_shouldSimulateExpiredToken()) {
        return await _createExpiredTokenResponse(options);
      }
      return await _loadMockJson(
        'lib/core/mocks/auth/profile_response.json',
        options,
      );
    }

    // Refresh Token
    if (path.contains('/auth/refresh') && method == 'POST') {
      _loginTime = DateTime.now();
      _requestCount = 0;
      return await _loadMockJson(
        'lib/core/mocks/auth/refresh_token_response.json',
        options,
      );
    }

    // Default 404
    return Response(
      requestOptions: options,
      statusCode: 404,
      data: {
        'statusCode': 404,
        'message': 'Mock endpoint not found: $method $path',
        'data': null,
      },
    );
  }

  /// Handle login request
  Future<Response> _handleLogin(RequestOptions options) async {
    final requestData = options.data as Map<String, dynamic>?;
    final email = requestData?['email'] as String?;
    final password = requestData?['password'] as String?;

    print('🎭 MOCK LOGIN: email=$email, password=$password');

    // Validate credentials
    if (email == mockEmail && password == mockPassword) {
      _loginTime = DateTime.now();
      _requestCount = 0;
      return await _loadMockJson(
        'lib/core/mocks/auth/auth_response.json',
        options,
      );
    } else {
      // Invalid credentials
      return Response(
        requestOptions: options,
        statusCode: 401,
        data: {
          'statusCode': 401,
          'message': 'Invalid email or password',
          'data': null,
        },
      );
    }
  }

  /// Handle request OTP
  Future<Response> _handleRequestOtp(RequestOptions options) async {
    final requestData = options.data as Map<String, dynamic>?;
    final phoneNumber = requestData?['phoneNumber'] as String?;

    print('🎭 MOCK REQUEST OTP: phoneNumber=$phoneNumber');

    // Accept any phone number for mock
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      return await _loadMockJson(
        'lib/core/mocks/auth/otp_request_response.json',
        options,
      );
    } else {
      return Response(
        requestOptions: options,
        statusCode: 400,
        data: {
          'statusCode': 400,
          'message': 'Phone number is required',
          'data': null,
        },
      );
    }
  }

  /// Handle verify OTP
  Future<Response> _handleVerifyOtp(RequestOptions options) async {
    final requestData = options.data as Map<String, dynamic>?;
    final phoneNumber = requestData?['phoneNumber'] as String?;
    final otp = requestData?['otp'] as String?;

    print('🎭 MOCK VERIFY OTP: phoneNumber=$phoneNumber, otp=$otp');

    // Validate OTP (accept mockOtp or 123456 for testing)
    if (otp == mockOtp || otp == '123456') {
      _loginTime = DateTime.now();
      _requestCount = 0;
      return await _loadMockJson(
        'lib/core/mocks/auth/otp_verify_response.json',
        options,
      );
    } else {
      return Response(
        requestOptions: options,
        statusCode: 400,
        data: {'statusCode': 400, 'message': 'Invalid OTP', 'data': null},
      );
    }
  }

  /// Check if we should simulate token expiration
  bool _shouldSimulateExpiredToken() {
    if (_loginTime == null) return false;

    final timeSinceLogin = DateTime.now().difference(_loginTime!);

    // Simulate token expiration after 5 minutes OR 10 requests
    return timeSinceLogin.inMinutes >= 5 || _requestCount >= 10;
  }

  /// Create expired token response
  Future<Response> _createExpiredTokenResponse(RequestOptions options) async {
    print('🎭 MOCK: Simulating expired token');
    return Response(
      requestOptions: options,
      statusCode: 401,
      data: {'statusCode': 401, 'message': 'Token expired', 'data': null},
    );
  }

  /// Load mock JSON file from assets
  Future<Response> _loadMockJson(
    String assetPath,
    RequestOptions options,
  ) async {
    try {
      print('🎭 MOCK: Loading $assetPath');
      final jsonString = await rootBundle.loadString(assetPath);
      final jsonData = json.decode(jsonString);

      return Response(
        requestOptions: options,
        statusCode: jsonData['statusCode'] ?? 200,
        data: jsonData,
      );
    } catch (e) {
      print('❌ MOCK: Failed to load $assetPath: $e');
      throw Exception('Failed to load mock data from $assetPath: $e');
    }
  }
}
