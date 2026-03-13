/// All API-related constants used across the application.
///
/// Centralises base URL and endpoint paths so they can be updated in one place.
library;

class ApiConstants {
  ApiConstants._(); // Prevent instantiation

  /// Base URL for TheMealDB public API (free tier, key = 1).
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  // ── Endpoints ──────────────────────────────────────────────────

  /// Returns all meals matching a search keyword.
  /// Query param: `s` (e.g. `?s=Arrabiata`)
  static const String searchMeals = '/search.php';

  /// Returns meals belonging to a specific category.
  /// Query param: `c` (e.g. `?c=Seafood`)
  static const String filterByCategory = '/filter.php';

  /// Returns all available meal categories.
  /// Query param: `c=list`
  static const String listCategories = '/list.php';

  /// Returns full details for a single meal by its ID.
  /// Query param: `i` (e.g. `?i=52772`)
  static const String lookupMealById = '/lookup.php';

  /// Returns a single random meal.
  static const String randomMeal = '/random.php';

  /// Fruityvice endpoint that returns all available fruits.
  static const String fruitAll = 'https://www.fruityvice.com/api/fruit/all';

  // ── Network timeouts ───────────────────────────────────────────

  /// Maximum time (seconds) to wait for a connection to be established.
  static const int connectTimeoutSeconds = 10;

  /// Maximum time (seconds) to wait for the server to send a full response.
  static const int receiveTimeoutSeconds = 15;
}
