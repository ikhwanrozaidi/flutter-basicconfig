import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  // Initial state
  const factory AuthState.initial() = Initial;

  // Loading state
  const factory AuthState.loading() = Loading;

  // OTP requested successfully
  const factory AuthState.otpSent({
    required String phoneNumber,
    required String message,
  }) = OtpSent;

  // Authenticated with user
  const factory AuthState.authenticated(UserEntity user) = Authenticated;

  // Not authenticated
  const factory AuthState.unauthenticated() = Unauthenticated;

  // Error state
  const factory AuthState.error(String message) = Error;
}
