// lib/core/utils/responsive_helper.dart

import 'package:flutter/material.dart';

/// Helper class for responsive UI design
class ResponsiveHelper {
  static const double _mobileBreakpoint = 600;
  static const double _tabletBreakpoint = 900;
  static const double _desktopBreakpoint = 1200;

  /// Get screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Check if device is mobile
  static bool isMobile(BuildContext context) {
    return screenWidth(context) < _mobileBreakpoint;
  }

  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    final width = screenWidth(context);
    return width >= _mobileBreakpoint && width < _tabletBreakpoint;
  }

  /// Check if device is desktop
  static bool isDesktop(BuildContext context) {
    return screenWidth(context) >= _desktopBreakpoint;
  }

  /// Get responsive value based on screen size
  static T responsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    }
    if (isTablet(context) && tablet != null) {
      return tablet;
    }
    return mobile;
  }

  /// Scale size based on screen width (relative to 375px design)
  static double scale(BuildContext context, double size) {
    final width = screenWidth(context);
    const designWidth = 375.0; // Base design width
    return (size * width) / designWidth;
  }

  /// Scale height based on screen height (relative to 812px design)
  static double scaleHeight(BuildContext context, double size) {
    final height = screenHeight(context);
    const designHeight = 812.0; // Base design height
    return (size * height) / designHeight;
  }

  /// Get responsive padding
  static EdgeInsets responsivePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: responsiveValue(
        context,
        mobile: 16.0,
        tablet: 24.0,
        desktop: 32.0,
      ),
      vertical: 16.0,
    );
  }

  /// Get responsive font size
  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    return responsiveValue(
      context,
      mobile: baseFontSize,
      tablet: baseFontSize * 1.1,
      desktop: baseFontSize * 1.2,
    );
  }

  /// Get device type as string
  static String deviceType(BuildContext context) {
    if (isDesktop(context)) return 'desktop';
    if (isTablet(context)) return 'tablet';
    return 'mobile';
  }

  /// Get safe area padding
  static EdgeInsets safeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  /// Get status bar height
  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Get bottom navigation bar height (including safe area)
  static double bottomBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom + 56.0;
  }
}
