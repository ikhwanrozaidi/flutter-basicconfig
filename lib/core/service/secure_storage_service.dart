// lib/core/service/secure_storage_service.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Service for secure storage of sensitive data (tokens, credentials)
@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  // Storage keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _passcodeKey = 'passcode';
  static const String _biometricEnabledKey = 'biometric_enabled';

  // ==================== Token Management ====================

  /// Save access token
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
    print('✅ Access token saved');
  }

  /// Get access token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  /// Save refresh token
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
    print('✅ Refresh token saved');
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  /// Save both tokens
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      saveAccessToken(accessToken),
      saveRefreshToken(refreshToken),
    ]);
  }

  /// Clear all tokens
  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
    print('🗑️ Tokens cleared');
  }

  /// Check if user has valid tokens
  Future<bool> hasValidTokens() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    return accessToken != null && refreshToken != null;
  }

  // ==================== User Data ====================

  /// Save user ID
  Future<void> saveUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  /// Get user ID
  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  // ==================== Security ====================

  /// Save passcode (hashed)
  Future<void> savePasscode(String hashedPasscode) async {
    await _storage.write(key: _passcodeKey, value: hashedPasscode);
  }

  /// Get passcode (hashed)
  Future<String?> getPasscode() async {
    return await _storage.read(key: _passcodeKey);
  }

  /// Clear passcode
  Future<void> clearPasscode() async {
    await _storage.delete(key: _passcodeKey);
  }

  /// Enable/disable biometric
  Future<void> setBiometricEnabled(bool enabled) async {
    await _storage.write(key: _biometricEnabledKey, value: enabled.toString());
  }

  /// Check if biometric is enabled
  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _biometricEnabledKey);
    return value == 'true';
  }

  // ==================== General ====================

  /// Clear all secure storage
  Future<void> clearAll() async {
    await _storage.deleteAll();
    print('🗑️ All secure storage cleared');
  }

  /// Read custom key
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Write custom key
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Delete custom key
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}
