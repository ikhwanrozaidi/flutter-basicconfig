import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/otp_input_field.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationPage({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String _otp = '';

  void _handleVerifyOtp() {
    if (_otp.length == 6) {
      context.read<AuthBloc>().add(
        AuthEvent.verifyOtp(phoneNumber: widget.phoneNumber, otp: _otp),
      );
    } else {
      context.showSnackBar('Please enter complete OTP', isError: true);
    }
  }

  void _handleResendOtp() {
    context.read<AuthBloc>().add(AuthEvent.requestOtp(widget.phoneNumber));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            otpSent: (phoneNumber, message) {
              context.showSnackBar(message);
            },
            authenticated: (user) {
              // Navigation handled by AuthWrapper
            },
            unauthenticated: () {},
            error: (message) {
              context.showSnackBar(message, isError: true);
            },
          );
        },
        builder: (context, state) {
          final isLoading = state is Loading;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    'Enter Verification Code',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We sent a code to ${widget.phoneNumber}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 40),

                  // OTP Input
                  OtpInputField(
                    length: 6,
                    onCompleted: (otp) {
                      setState(() => _otp = otp);
                    },
                    onChanged: (otp) {
                      setState(() => _otp = otp);
                    },
                  ),
                  const SizedBox(height: 32),

                  // Verify Button
                  CustomButton(
                    text: 'Verify',
                    onPressed: isLoading ? null : _handleVerifyOtp,
                    isLoading: isLoading,
                  ),
                  const SizedBox(height: 16),

                  // Resend OTP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive code? ",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      GestureDetector(
                        onTap: isLoading ? null : _handleResendOtp,
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
