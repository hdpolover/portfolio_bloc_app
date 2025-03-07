import 'package:flutter/material.dart';

/// App color palette for Code Clarity theme.
/// Contains all colors used throughout the application.
class AppColors {
  // Primary colors (Background and Surface)
  static const primary = Color(0xFF282C34); // Dark Background
  static const secondary = Color(0xFF3E4451); // Secondary Background/Card

  // Accent Colors
  static const accent =
      Color(0xFF61AFEF); // Highlight for active elements, buttons, links
  static const accentSecondary =
      Color(0xFF5C6370); // Slightly darker gray for less important elements

  // Text Colors
  static const textPrimary = Color(0xFFABB2BF); // Light Gray - Readable on dark
  static const textSecondary =
      Color(0xFF5C6370); // Slightly darker gray for less important text

  // Status Colors (If needed)
  static const error = Colors.red;
  static const success = Colors.green;
  static const warning = Colors.yellow;

  // Border Colors
  static const border = Color(0xFF5C6370); // Border color

  // Gradient colors (If needed)
  static const gradientStart = accent;
  static const gradientEnd = accentSecondary;

  // Static utility methods for gradients (If needed)
  static LinearGradient primaryGradient() {
    return LinearGradient(
      colors: [gradientStart, gradientEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
