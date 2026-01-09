# Mock Data Testing Guide

## Mock Mode

Mock mode is automatically enabled in **development** flavor.
```bash
flutter run --flavor development -t lib/main_development.dart
```

## Test Credentials

### Email Login
- **Email:** `demo@example.com`
- **Password:** `password123`

### Phone Login
- **Phone:** Any valid phone number (e.g., `+60123456789`)
- **OTP:** `123456` (or any 6-digit code)

## Mock Behavior

### Token Expiration
The mock system simulates token expiration after:
- **5 minutes** from login, OR
- **10 API requests** after login

When token expires, the app will automatically:
1. Detect 401 error
2. Call refresh token endpoint
3. Retry the original request with new token

### Mock Endpoints

| Endpoint | Method | Response File |
|----------|--------|---------------|
| `/auth/login` | POST | `auth_response.json` |
| `/auth/request-otp` | POST | `otp_request_response.json` |
| `/auth/verify-otp` | POST | `otp_verify_response.json` |
| `/auth/logout` | POST | `logout_response.json` |
| `/auth/profile` | GET | `profile_response.json` |
| `/auth/refresh` | POST | `refresh_token_response.json` |

## Adding New Mock Endpoints

1. Create JSON file in `lib/core/mocks/[feature]/`
2. Add to `pubspec.yaml` assets
3. Update `MockInterceptor._getMockResponse()` with new endpoint handling

## Switching to Real API

Change flavor to staging or production:
```bash
# Staging (real API)
flutter run --flavor staging -t lib/main_staging.dart

# Production (real API)
flutter run --flavor production -t lib/main_production.dart
```

Or update `flavor_config.dart`:
```dart
factory FlavorConfig.development() => FlavorConfig(
  // ...
  useMockData: false,  // ← Change to false
);
```