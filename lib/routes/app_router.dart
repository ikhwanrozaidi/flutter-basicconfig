import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constant/route_constant.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/otp_verification_page.dart';
import '../shared/pages/root_page.dart';
import '../shared/widgets/auth_wrapper.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePath.root,
  debugLogDiagnostics: true,
  routes: [
    // Root - Auth Wrapper decides what to show
    GoRoute(
      path: AppRoutePath.root,
      name: AppRouteName.root,
      builder: (context, state) => const AuthWrapper(),
    ),

    // Login Page
    GoRoute(
      path: AppRoutePath.login,
      name: AppRouteName.login,
      builder: (context, state) => const LoginPage(),
    ),

    // OTP Verification Page
    GoRoute(
      path: AppRoutePath.otpVerification,
      name: AppRouteName.otpVerification,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final phoneNumber = extra?['phoneNumber'] as String? ?? '';

        return OtpVerificationPage(phoneNumber: phoneNumber);
      },
    ),

    // Main App (with bottom navigation)
    GoRoute(
      path: AppRoutePath.main,
      name: AppRouteName.main,
      builder: (context, state) => const RootPage(),
    ),
  ],

  // Error handling
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Page not found', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            state.uri.toString(),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go(AppRoutePath.root),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);
