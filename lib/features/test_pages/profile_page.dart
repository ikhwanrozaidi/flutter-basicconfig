import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../auth/presentation/bloc/auth_bloc.dart';
import '../auth/presentation/bloc/auth_event.dart';
import '../auth/presentation/bloc/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (user) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Profile Header
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(
                      context,
                    ).primaryColor.withOpacity(0.1),
                    child: user.profilePicture != null
                        ? ClipOval(
                            child: Image.network(
                              user.profilePicture!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return _buildInitials(context, user.username);
                              },
                            ),
                          )
                        : _buildInitials(context, user.username),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.fullName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.email,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 32),

                  // Profile Info
                  _InfoCard(
                    title: 'Username',
                    value: user.username,
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 12),
                  _InfoCard(
                    title: 'Phone Number',
                    value: user.phoneNumber ?? 'Not set',
                    icon: Icons.phone_outlined,
                  ),
                  const SizedBox(height: 12),
                  _InfoCard(
                    title: 'Email Verified',
                    value: user.isEmailVerified ? 'Yes' : 'No',
                    icon: user.isEmailVerified
                        ? Icons.check_circle_outline
                        : Icons.cancel_outlined,
                    valueColor: user.isEmailVerified
                        ? Colors.green
                        : Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _InfoCard(
                    title: 'Phone Verified',
                    value: user.isPhoneVerified ? 'Yes' : 'No',
                    icon: user.isPhoneVerified
                        ? Icons.check_circle_outline
                        : Icons.cancel_outlined,
                    valueColor: user.isPhoneVerified
                        ? Colors.green
                        : Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _InfoCard(
                    title: 'Member Since',
                    value: user.createdAt.formatted,
                    icon: Icons.calendar_today_outlined,
                  ),
                  const SizedBox(height: 32),

                  // Logout Button
                  CustomButton(
                    text: 'Logout',
                    backgroundColor: Colors.red,
                    icon: Icons.logout,
                    onPressed: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget _buildInitials(BuildContext context, String username) {
    return Text(
      username[0].toUpperCase(),
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? valueColor;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
        ),
        subtitle: Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ),
    );
  }
}
