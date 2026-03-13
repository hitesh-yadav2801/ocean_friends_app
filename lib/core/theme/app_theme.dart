import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';

/// Assembles the full [ThemeData] used by [MaterialApp.router].
///
/// All colour values are sourced from [AppColors] and typography from
/// [AppTextStyles].
abstract final class AppTheme {
  /// Primary application theme (light mode).
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      navigationBarTheme: _navigationBarTheme,
      cardTheme: _cardTheme,
      chipTheme: _chipTheme,
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 0,
      ),
    );
  }

  // ── Color scheme ────────────────────────────────────────────────
  static const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: AppColors.primaryLight,
    onPrimaryContainer: AppColors.primaryDark,
    secondary: AppColors.rating,
    onSecondary: Colors.white,
    secondaryContainer: AppColors.secondary20,
    onSecondaryContainer: AppColors.rating,
    surface: AppColors.surface,
    onSurface: AppColors.labelColor,
    error: AppColors.error,
    onError: Colors.white,
    outline: AppColors.outline,
    outlineVariant: AppColors.divider,
  );

  // ── App bar ─────────────────────────────────────────────────────
  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.labelColor,
    elevation: 0,
    scrolledUnderElevation: 1,
    centerTitle: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // ── Text theme — maps Material 3 roles to our tokens ───────────
  static TextTheme get _textTheme => TextTheme(
    displayLarge: AppTextStyles.displayLarge,
    displayMedium: AppTextStyles.displayMedium,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.headlineSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
  );

  // ── Input fields ────────────────────────────────────────────────
  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceVariant,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray4),
  );

  // ── Elevated button ─────────────────────────────────────────────
  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTextStyles.labelLarge,
        ),
      );

  // ── Outlined button ─────────────────────────────────────────────
  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTextStyles.labelLarge,
        ),
      );

  // ── Navigation bar ─────────────────────────────────────────────
  static NavigationBarThemeData get _navigationBarTheme =>
      NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primaryLight,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.labelSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            );
          }

          return AppTextStyles.labelSmall.copyWith(
            color: AppColors.gray3,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary);
          }

          return const IconThemeData(color: AppColors.gray3);
        }),
      );

  // ── Card ────────────────────────────────────────────────────────
  static CardThemeData get _cardTheme => CardThemeData(
    color: AppColors.surface,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: AppColors.divider),
    ),
    margin: EdgeInsets.zero,
  );

  // ── Chip ────────────────────────────────────────────────────────
  static ChipThemeData get _chipTheme => ChipThemeData(
    backgroundColor: AppColors.surfaceVariant,
    selectedColor: AppColors.primaryLight,
    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    side: BorderSide.none,
    labelStyle: AppTextStyles.labelMedium,
    showCheckmark: false,
  );
}
