import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_event.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../pages/root_page.dart';

/// AuthWrapper decides what to show based on authentication state
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Check auth status on app start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _SplashScreen(),
          loading: () => const _SplashScreen(),
          otpSent: (phoneNumber, message) => const LoginPage(),
          authenticated: (user) {
            print('🎉 User authenticated, showing RootPage');
            return const RootPage();
          },
          unauthenticated: () {
            print('🔓 User not authenticated, showing LoginPage');
            return const LoginPage();
          },
          error: (message) {
            print('❌ Auth error: $message');
            return const LoginPage();
          },
        );
      },
    );
  }
}

/// Splash screen shown during initial auth check
class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo or Animation
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset(
                'assets/lottie/loading.json',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback if lottie file doesn't exist
                  return const Icon(
                    Icons.account_balance_wallet,
                    size: 100,
                    color: Colors.blue,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              'Checking authentication...',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
