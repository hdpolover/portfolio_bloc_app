import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// App theme configuration
/// Contains light and dark themes with consistent styling
class AppTheme {
  ThemeData codeClarityTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.textPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.textPrimary,
      error: AppColors.error,
      onError: Colors.white,
      // background: AppColors.primary,
      // onBackground: AppColors.textPrimary,
      surface: AppColors.secondary,
      onSurface: AppColors.textPrimary,
    ),
    scaffoldBackgroundColor: AppColors.primary,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.robotoMono(
        fontSize: 96.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.textPrimary,
      ),
      displayMedium: GoogleFonts.robotoMono(
        fontSize: 60.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.textPrimary,
      ),
      displaySmall: GoogleFonts.robotoMono(
        fontSize: 48.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.textPrimary,
      ),
      headlineLarge: GoogleFonts.robotoMono(
        fontSize: 32.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      headlineMedium: GoogleFonts.robotoMono(
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      headlineSmall: GoogleFonts.robotoMono(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      titleLarge: GoogleFonts.robotoMono(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      titleMedium: GoogleFonts.robotoMono(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      titleSmall: GoogleFonts.robotoMono(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      bodyLarge: GoogleFonts.robotoMono(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      bodyMedium: GoogleFonts.robotoMono(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      bodySmall: GoogleFonts.robotoMono(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      labelLarge: GoogleFonts.robotoMono(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      labelMedium: GoogleFonts.robotoMono(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      labelSmall: GoogleFonts.robotoMono(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textPrimary,
      titleTextStyle: GoogleFonts.robotoMono(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
    ),
    cardColor: AppColors.secondary,
    dividerColor: AppColors.textSecondary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.robotoMono(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accent,
        textStyle: GoogleFonts.robotoMono(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textSecondary),
        borderRadius: BorderRadius.circular(8.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.accent),
        borderRadius: BorderRadius.circular(8.r),
      ),
      labelStyle: GoogleFonts.robotoMono(color: AppColors.textPrimary),
      hintStyle: GoogleFonts.robotoMono(color: AppColors.textSecondary),
    ),
  );
}
