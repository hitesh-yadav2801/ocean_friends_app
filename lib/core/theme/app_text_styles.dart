import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';

/// Typography scale for the app.
///
/// All sizes are defined using [flutter_screenutil]'s `.sp` extension to
/// scale proportionally across different screen densities.
/// Reference: Google Material 3 type scale.
abstract final class AppTextStyles {
  // ── Display styles — large hero text ──────────────────────────
  static TextStyle get displayLarge => GoogleFonts.poppins(
    fontSize: 57.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.labelColor,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static TextStyle get displayMedium => GoogleFonts.poppins(
    fontSize: 45.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.labelColor,
    letterSpacing: 0,
    height: 1.16,
  );

  // ── Headline styles — section headings ────────────────────────
  static TextStyle get headlineLarge => GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.labelColor,
    letterSpacing: 0,
    height: 1.25,
  );

  static TextStyle get headlineMedium => GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.labelColor,
    letterSpacing: 0,
    height: 1.29,
  );

  static TextStyle get headlineSmall => GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.labelColor,
    letterSpacing: 0,
    height: 1.33,
  );

  // ── Title styles — card titles, list item titles ──────────────
  static TextStyle get titleLarge => GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.labelColor,
    letterSpacing: 0,
    height: 1.27,
  );

  static TextStyle get titleMedium => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.labelColor,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static TextStyle get titleSmall => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.labelColor,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // ── Body styles — paragraph text ──────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.labelColor,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.labelColor,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static TextStyle get bodySmall => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray3,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // ── Label styles — buttons, chips, captions ───────────────────
  static TextStyle get labelLarge => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.labelColor,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static TextStyle get labelMedium => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.labelColor,
    letterSpacing: 0.5,
    height: 1.33,
  );

  static TextStyle get labelSmall => GoogleFonts.poppins(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.gray3,
    letterSpacing: 0.5,
    height: 1.45,
  );
}
