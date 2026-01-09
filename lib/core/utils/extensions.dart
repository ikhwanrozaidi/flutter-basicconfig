// lib/core/utils/extensions.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// String extensions
extension StringExtensions on String {
  /// Capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalize each word
  String capitalizeWords() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Check if string is a valid email
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Check if string is a valid phone number
  bool get isValidPhone {
    final cleaned = replaceAll(RegExp(r'[^\d+]'), '');
    return cleaned.length >= 10 && cleaned.length <= 15;
  }

  /// Truncate string with ellipsis
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }

  /// Remove all whitespace
  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }
}

/// DateTime extensions
extension DateTimeExtensions on DateTime {
  /// Format as 'Jan 01, 2024'
  String get formatted {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  /// Format as '01/01/2024'
  String get shortDate {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  /// Format as '01 Jan 2024, 10:30 AM'
  String get fullDateTime {
    return DateFormat('dd MMM yyyy, hh:mm a').format(this);
  }

  /// Format as '10:30 AM'
  String get timeOnly {
    return DateFormat('hh:mm a').format(this);
  }

  /// Get relative time (e.g., "2 hours ago")
  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }
}

/// BuildContext extensions
extension ContextExtensions on BuildContext {
  /// Get screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Get screen width
  double get screenWidth => screenSize.width;

  /// Get screen height
  double get screenHeight => screenSize.height;

  /// Show snackbar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Hide keyboard
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

/// List extensions
extension ListExtensions<T> on List<T> {
  /// Check if list is null or empty
  bool get isNullOrEmpty => isEmpty;

  /// Get first element or null
  T? get firstOrNull => isEmpty ? null : first;

  /// Get last element or null
  T? get lastOrNull => isEmpty ? null : last;
}
