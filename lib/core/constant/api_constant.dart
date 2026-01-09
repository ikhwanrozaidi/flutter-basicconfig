// lib/core/constants/api_constants.dart

class ApiConstants {
  // Base paths
  static const String authBase = '/auth';
  static const String notesBase = '/notes';

  // Auth Endpoints
  static const String login = '$authBase/login';
  static const String register = '$authBase/register';
  static const String logout = '$authBase/logout';
  static const String refreshToken = '$authBase/refresh';
  static const String requestOtp = '$authBase/request-otp';
  static const String verifyOtp = '$authBase/verify-otp';
  static const String profile = '$authBase/profile';

  // Notes Endpoints (Example CRUD)
  static const String notes = notesBase;
  static String noteById(String id) => '$notesBase/$id';

  // Headers
  static const String authorizationHeader = 'Authorization';
  static const String contentTypeHeader = 'Content-Type';
  static const String acceptHeader = 'Accept';

  // Content Types
  static const String jsonContentType = 'application/json';
  static const String formContentType = 'application/x-www-form-urlencoded';
  static const String multipartContentType = 'multipart/form-data';
}
