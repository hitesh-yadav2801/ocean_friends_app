import 'package:go_router/go_router.dart' show GoRouter;

/// Named route path constants used by [GoRouter].
///
/// Defines constant routing paths and names for the application.
abstract final class RouteNames {
  // ── Paths ──────────────────────────────────────────────────────
  /// Root path for the home screen.
  static const String home = '/home';

  /// Path for the splash screen.
  static const String splash = '/';

  /// Path for the search screen.
  static const String search = '/search';

  /// Path for the recipe detail screen. Requires [recipeId] path parameter.
  static const String recipeDetail = '/recipe/:id';

  // ── Named identifiers ──────────────────────────────────────────
  /// Named route identifier for the home screen.
  static const String homeName = 'home';

  /// Named route identifier for the search screen.
  static const String searchName = 'search';

  /// Named route identifier for the recipe detail screen.
  static const String recipeDetailName = 'recipeDetail';
}
