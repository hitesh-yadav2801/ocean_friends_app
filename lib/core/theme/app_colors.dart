import 'package:flutter/material.dart';

/// Brand colour tokens for the app.
///
/// Define all colours here as static constants. Never use raw hex values
/// outside this file — always reference tokens (e.g. [AppColors.primary]).
abstract final class AppColors {
  // ── Primary brand palette ──────────────────────────────────────
  /// Main brand colour — used for primary buttons, active states, key accents.
  static const Color primary = Color(0xFF139D7E); // Teal from active chip

  /// Lighter tint of the primary colour.
  static const Color primaryLight = Color(0xFFD1F5EE);

  /// Darker shade of the primary colour.
  static const Color primaryDark = Color(0xFF0F7A62);

  // ── Secondary / Rating palette ─────────────────────────────────
  /// Secondary colour used for rating stars.
  static const Color rating = Color(0xFFFFAD30);

  /// Secondary tint for rating backgrounds (Secondary 20).
  static const Color secondary20 = Color(0xFFFFE1B3);

  // ── Surface & background ───────────────────────────────────────
  /// Main background colour.
  static const Color background = Color(0xFFFFFFFF);

  /// Surface colour.
  static const Color surface = Color(0xFFFFFFFF);

  /// Edge cases and subtle backgrounds.
  static const Color surfaceVariant = Color(0xFFF8F9FA);

  // ── Text & Label colours ───────────────────────────────────────
  /// Primary label colour.
  static const Color labelColor = Color(0xFF121212);

  /// Pure black.
  static const Color black = Color(0xFF000000);

  /// Secondary text.
  static const Color gray3 = Color(0xFFA9A9A9);

  /// Tertiary text, outlines, and dividers.
  static const Color gray4 = Color(0xFFD9D9D9);

  // ── Feedback colours ───────────────────────────────────────────
  static const Color error = Color(0xFFE53E3E);
  static const Color success = Color(0xFF38A169);
  static const Color warning = Color(0xFFDD6B20);

  // ── Dividers & outlines ────────────────────────────────────────
  static const Color divider = Color(0xFFD9D9D9); // Gray 4
  static const Color outline = Color(0xFFD9D9D9); // Gray 4
  
  // ── Overlay & shadow ──────────────────────────────────────────
  static const Color scrim = Color(0x80000000);
}
