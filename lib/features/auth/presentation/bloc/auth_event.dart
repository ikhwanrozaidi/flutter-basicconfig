import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  // Check authentication status on app start
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;

  // Request OTP for phone number
  const factory AuthEvent.requestOtp(String phoneNumber) = RequestOtp;

  // Verify OTP
  const factory AuthEvent.verifyOtp({
    required String phoneNumber,
    required String otp,
  }) = VerifyOtp;

  // Login with email and password
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = Login;

  // Logout
  const factory AuthEvent.logout() = Logout;

  // Clear error
  const factory AuthEvent.clearError() = ClearError;
}
