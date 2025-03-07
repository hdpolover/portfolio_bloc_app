import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// App text styles
/// Contains all text styles used throughout the application
class AppTextStyles {
  // Headings
  static TextStyle h1({Color? color}) => GoogleFonts.poppins(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h2({Color? color}) => GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h3({Color? color}) => GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        height: 1.4,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h4({Color? color}) => GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h5({Color? color}) => GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: color ?? AppColors.textPrimary,
      );

  // Body text
  static TextStyle bodyLarge({Color? color}) => GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: color ?? AppColors.textSecondary,
      );

  // Button text
  static TextStyle buttonLarge({Color? color}) => GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle buttonMedium({Color? color}) => GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle buttonSmall({Color? color}) => GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  // Special styles
  static TextStyle caption({Color? color}) => GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5,
        height: 1.4,
        color: color ?? AppColors.textSecondary,
      );

  static TextStyle overline({Color? color}) => GoogleFonts.poppins(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        height: 1.4,
        color: color ?? AppColors.textSecondary,
      );

  // Helper method for responsive text sizes based on device type
  static TextStyle responsive({
    required TextStyle mobileStyle,
    TextStyle? tabletStyle,
    TextStyle? desktopStyle,
    BuildContext? context,
  }) {
    if (context == null) return mobileStyle;

    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1280 && desktopStyle != null) {
      return desktopStyle;
    } else if (screenWidth >= 768 && tabletStyle != null) {
      return tabletStyle;
    }
    return mobileStyle;
  }
}
