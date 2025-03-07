import 'package:flutter/material.dart';

/// App color palette
/// Contains all colors used throughout the application
class AppColors {
  // Primary colors
  static const primary = Color(0xFF2563EB); // Rich blue
  static const primaryLight = Color(0xFF60A5FA);
  static const primaryDark = Color(0xFF1E40AF);

  // Secondary colors
  static const secondary = Color(0xFFF97316); // Vibrant orange
  static const secondaryLight = Color(0xFFFDBA74);
  static const secondaryDark = Color(0xFFC2410C);

  // Neutral colors
  static const background = Color(0xFFFFFFFF);
  static const surface = Color(0xFFF9FAFB);
  static const cardBackground = Color(0xFFFFFFFF);

  // Text colors
  static const textPrimary = Color(0xFF111827);
  static const textSecondary = Color(0xFF6B7280);
  static const textDisabled = Color(0xFF9CA3AF);
  static const textOnPrimary = Color(0xFFFFFFFF);

  // Status colors
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);

  // Border colors
  static const border = Color(0xFFE5E7EB);
  static const borderStrong = Color(0xFFD1D5DB);

  // Gradient colors
  static const gradientStart = primary;
  static const gradientEnd = primaryLight;

  // Static utility methods for gradients
  static LinearGradient primaryGradient() {
    return LinearGradient(
      colors: [gradientStart, gradientEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
