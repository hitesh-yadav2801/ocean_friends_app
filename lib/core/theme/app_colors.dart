import 'package:flutter/material.dart';

/// Brand colour tokens for the app.
///
/// Define all colours here as static constants. Never use raw hex values
/// outside this file — always reference tokens (e.g. [AppColors.primary]).
/// Values prefixed with a comment will be updated once the Figma design is confirmed.
abstract final class AppColors {
  // ── Primary brand palette ──────────────────────────────────────
  /// Main brand colour — used for primary buttons, active states, key accents.
  static const Color primary = Color(0xFFFF6B35);

  /// Lighter tint of the primary colour — used for backgrounds and chips.
  static const Color primaryLight = Color(0xFFFFE5D9);

  /// Darker shade of the primary colour — used for pressed states.
  static const Color primaryDark = Color(0xFFD94F1E);

  // ── Secondary / accent palette ─────────────────────────────────
  /// Secondary accent — used for highlight badges and tags.
  static const Color secondary = Color(0xFF1ABC9C);

  /// Light version of the secondary accent colour.
  static const Color secondaryLight = Color(0xFFD1F5EE);

  // ── Surface & background ───────────────────────────────────────
  /// Main background colour for pages.
  static const Color background = Color(0xFFF8F9FA);

  /// Surface colour for cards, bottom sheets, and elevated containers.
  static const Color surface = Color(0xFFFFFFFF);

  /// Background colour for input fields and subtle containers.
  static const Color surfaceVariant = Color(0xFFF0F0F0);

  // ── Text colours ───────────────────────────────────────────────
  /// Default text colour for body copy and titles.
  static const Color textPrimary = Color(0xFF1A1A2E);

  /// Secondary text colour for subtitles and meta info.
  static const Color textSecondary = Color(0xFF6B7280);

  /// Tertiary text colour for captions and hints inside inputs.
  static const Color textTertiary = Color(0xFFADB5BD);

  // ── Status & feedback colours ──────────────────────────────────
  /// Colour used for error messages and destructive actions.
  static const Color error = Color(0xFFE53E3E);

  /// Colour used for success indicators and confirmations.
  static const Color success = Color(0xFF38A169);

  /// Colour used for warnings and cautionary messages.
  static const Color warning = Color(0xFFDD6B20);

  // ── Dividers & outlines ────────────────────────────────────────
  /// Thin separator line colour — used in lists and section dividers.
  static const Color divider = Color(0xFFE9ECEF);

  /// Border colour for input fields and outlined buttons.
  static const Color outline = Color(0xFFCED4DA);

  // ── Overlay & shadow ──────────────────────────────────────────
  /// Translucent black for image overlays and scrim effects.
  static const Color scrim = Color(0x80000000);
}
