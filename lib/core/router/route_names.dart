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

  /// Path for the daily nutrition requirements page.
  static const String dailyNutrition = '/daily-nutrition';

  /// Path for the shopping cart page.
  static const String cart = '/cart';

  /// Path for the recipe detail screen. Requires [recipeId] path parameter.
  static const String recipeDetail = '/recipe/:id';

  // ── Named identifiers ──────────────────────────────────────────
  /// Named route identifier for the home screen.
  static const String homeName = 'home';

  /// Named route identifier for the search screen.
  static const String searchName = 'search';

  /// Named route identifier for the daily nutrition requirements page.
  static const String dailyNutritionName = 'dailyNutrition';

  /// Named route identifier for the cart page.
  static const String cartName = 'cart';

  /// Named route identifier for the recipe detail screen.
  static const String recipeDetailName = 'recipeDetail';
}
