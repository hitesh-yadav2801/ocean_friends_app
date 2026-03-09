import 'package:go_router/go_router.dart' show GoRouter;

/// Named route path constants used by [GoRouter].
///
/// Use [RouteNames] everywhere instead of raw path strings — one source of truth.
abstract final class RouteNames {
  // ── Paths ──────────────────────────────────────────────────────
  /// Root path for the recipe browse/search screen.
  static const String recipes = '/';

  /// Path for the recipe detail screen. Requires [recipeId] path parameter.
  static const String recipeDetail = '/recipe/:id';

  // ── Named identifiers ──────────────────────────────────────────
  /// Named route identifier for the recipes browse screen.
  static const String recipesName = 'recipes';

  /// Named route identifier for the recipe detail screen.
  static const String recipeDetailName = 'recipeDetail';
}
