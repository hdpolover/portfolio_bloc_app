import 'package:flutter/material.dart';
import 'app_text_styles.dart';
import 'colors.dart';

/// Theme helper for easier access to theme properties throughout the app
class AppThemeHelper {
  static ThemeData of(BuildContext context) => Theme.of(context);

  // Colors
  static ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;
  static Color primaryColor(BuildContext context) =>
      Theme.of(context).primaryColor;
  static Color backgroundColor(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  // Text styles - Directly using our AppTextStyles for simplicity and consistency
  static TextStyle h1(BuildContext context, {Color? color}) => AppTextStyles.h1(
      color: color ?? Theme.of(context).colorScheme.onBackground);

  static TextStyle h2(BuildContext context, {Color? color}) => AppTextStyles.h2(
      color: color ?? Theme.of(context).colorScheme.onBackground);

  static TextStyle h3(BuildContext context, {Color? color}) => AppTextStyles.h3(
      color: color ?? Theme.of(context).colorScheme.onBackground);

  static TextStyle h4(BuildContext context, {Color? color}) => AppTextStyles.h4(
      color: color ?? Theme.of(context).colorScheme.onBackground);

  static TextStyle h5(BuildContext context, {Color? color}) => AppTextStyles.h5(
      color: color ?? Theme.of(context).colorScheme.onBackground);

  static TextStyle bodyLarge(BuildContext context, {Color? color}) =>
      AppTextStyles.bodyLarge(
          color: color ?? Theme.of(context).colorScheme.onBackground);

  static TextStyle bodyMedium(BuildContext context, {Color? color}) =>
      AppTextStyles.bodyMedium(
          color: color ?? Theme.of(context).colorScheme.onBackground);

  static TextStyle bodySmall(BuildContext context, {Color? color}) =>
      AppTextStyles.bodySmall(
          color: color ?? Theme.of(context).colorScheme.onBackground);

  static TextStyle buttonText(BuildContext context, {Color? color}) =>
      AppTextStyles.buttonMedium(
          color: color ?? Theme.of(context).colorScheme.onPrimary);

  static TextStyle caption(BuildContext context, {Color? color}) =>
      AppTextStyles.caption(color: color ?? AppColors.textSecondary);

  // Common spacing values
  static double spacing(BuildContext context) => 8.0;
  static double spacingSmall(BuildContext context) => 4.0;
  static double spacingMedium(BuildContext context) => 16.0;
  static double spacingLarge(BuildContext context) => 24.0;
  static double spacingXLarge(BuildContext context) => 32.0;

  // Border radius
  static BorderRadius borderRadiusSmall(BuildContext context) =>
      BorderRadius.circular(4.0);
  static BorderRadius borderRadius(BuildContext context) =>
      BorderRadius.circular(8.0);
  static BorderRadius borderRadiusLarge(BuildContext context) =>
      BorderRadius.circular(16.0);

  // Shadows
  static List<BoxShadow> lightShadow(BuildContext context) => [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        )
      ];

  static List<BoxShadow> mediumShadow(BuildContext context) => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        )
      ];

  static List<BoxShadow> strongShadow(BuildContext context) => [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 16,
          offset: const Offset(0, 8),
        )
      ];

  // Common padding
  static EdgeInsets paddingAll(BuildContext context) =>
      const EdgeInsets.all(16);
  static EdgeInsets paddingHorizontal(BuildContext context) =>
      const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets paddingVertical(BuildContext context) =>
      const EdgeInsets.symmetric(vertical: 16);

  // Screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1280;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280;
}
