import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_text_styles.dart';
import 'colors.dart';

/// App theme configuration
/// Contains light and dark themes with consistent styling
class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    // Color scheme
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.textOnPrimary,
      error: AppColors.error,
      onError: Colors.white,
      background: AppColors.background,
      onBackground: AppColors.textPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
    ),

    // Core colors
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,

    // Typography
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: TextTheme(
      // Display styles
      displayLarge: AppTextStyles.h1(),
      displayMedium: AppTextStyles.h2(),
      displaySmall: AppTextStyles.h3(),

      // Headline styles
      headlineMedium: AppTextStyles.h4(),
      headlineSmall: AppTextStyles.h5(),

      // Body styles
      bodyLarge: AppTextStyles.bodyLarge(),
      bodyMedium: AppTextStyles.bodyMedium(),
      bodySmall: AppTextStyles.bodySmall(),

      // Other styles
      labelLarge: AppTextStyles.buttonLarge(),
      labelMedium: AppTextStyles.buttonMedium(),
      labelSmall: AppTextStyles.buttonSmall(),
      titleMedium: AppTextStyles.bodyMedium(color: AppColors.textSecondary),
      titleSmall: AppTextStyles.caption(),
    ),

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.h5(color: AppColors.textOnPrimary),
      iconTheme: IconThemeData(color: AppColors.textOnPrimary),
    ),

    // Card theme
    cardTheme: CardTheme(
      color: AppColors.cardBackground,
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: AppColors.border, width: 1),
      ),
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        textStyle: AppTextStyles.buttonMedium(),
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.buttonMedium(color: AppColors.primary),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.buttonMedium(color: AppColors.primary),
        side: BorderSide(color: AppColors.primary, width: 1.5),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),

    // Input decoration
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.surface,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.error, width: 1),
      ),
      hintStyle: AppTextStyles.bodyMedium(color: AppColors.textDisabled),
      errorStyle: AppTextStyles.caption(color: AppColors.error),
    ),

    // Dialog theme
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.background,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      titleTextStyle: AppTextStyles.h4(),
      contentTextStyle: AppTextStyles.bodyMedium(),
    ),

    // Chip theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surface,
      disabledColor: AppColors.textDisabled.withOpacity(0.1),
      selectedColor: AppColors.primaryLight,
      secondarySelectedColor: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      labelStyle: AppTextStyles.bodySmall(),
      secondaryLabelStyle:
          AppTextStyles.bodySmall(color: AppColors.textOnPrimary),
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: AppColors.border),
      ),
    ),

    // Divider theme
    dividerTheme: DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: 24.h,
    ),

    // Bottom sheet theme
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.background,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
    ),

    // Snack bar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.textPrimary,
      contentTextStyle: AppTextStyles.bodyMedium(color: AppColors.background),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),
  );

  // Dark theme - can be expanded in the future
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      // Add dark theme customizations here
      );
}
