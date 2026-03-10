/// Application-wide constant values.
///
/// Use these instead of magic numbers or strings scattered throughout the code.
library;

class AppConstants {
  AppConstants._(); // Prevent instantiation

  // ── Design reference dimensions (for flutter_screenutil) ───────

  /// Reference device width used during UI design
  static const double designWidth = 375;

  /// Reference device height used during UI design
  static const double designHeight = 812;

  // ── Pagination ─────────────────────────────────────────────────

  /// Number of recipe cards to display per page / batch during lazy loading.
  static const int recipesPerPage = 20;

  // ── Local storage keys ─────────────────────────────────────────

  /// Hive box name for persisting the user's favourite recipe IDs.
  static const String favouritesBoxName = 'favourites_box';

  /// Hive box name for persisting recent search terms.
  static const String recentSearchesBoxName = 'recent_searches_box';

  /// Maximum number of recent search terms to retain.
  static const int maxRecentSearches = 10;

  // ── Animation durations ────────────────────────────────────────

  /// Standard duration for page transition and hero animations.
  static const Duration pageTransitionDuration = Duration(milliseconds: 400);

  /// Duration for micro-interaction animations (button press, chip select).
  static const Duration microAnimationDuration = Duration(milliseconds: 200);
}
