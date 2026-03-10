import 'package:equatable/equatable.dart';

/// Result of parsing a voice query — either a category filter or a keyword search.
sealed class VoiceQueryResult extends Equatable {
  const VoiceQueryResult();
}

/// The spoken text matched a known MealDB category — use category filter API.
class CategoryQuery extends VoiceQueryResult {
  const CategoryQuery(this.category);

  /// The exact category name to pass to the filter API (e.g. "Seafood").
  final String category;

  @override
  List<Object?> get props => [category];
}

/// The spoken text did not match any category — use keyword search API.
class KeywordQuery extends VoiceQueryResult {
  const KeywordQuery(this.keyword);

  /// The raw keyword(s) to pass to the search API.
  final String keyword;

  @override
  List<Object?> get props => [keyword];
}

/// Parses spoken text and decides whether it maps to a category or keyword search.
///
/// Strategy:
/// 1. Normalise the spoken text (lowercase, trim).
/// 2. Check if any known category name appears as a token in the spoken text.
/// 3. If matched → [CategoryQuery]. Otherwise → [KeywordQuery].
///
/// Example inputs → outputs:
/// - "Show me seafood" + categories=["Seafood", ...] → CategoryQuery("Seafood")
/// - "I want chicken pasta" + categories=["Chicken", ...] → CategoryQuery("Chicken")
/// - "Arrabiata" + categories=[...] → KeywordQuery("Arrabiata")
class SmartQueryParser {
  const SmartQueryParser._();

  /// Parses [spokenText] against the list of [knownCategories].
  ///
  /// [knownCategories] should contain the exact category names from the API
  /// (e.g. "Beef", "Chicken", "Dessert", "Seafood").
  static VoiceQueryResult parse(
    String spokenText,
    List<String> knownCategories,
  ) {
    final normalised = spokenText.toLowerCase().trim();
    if (normalised.isEmpty) return const KeywordQuery('');

    // Split spoken text into individual words for token matching.
    final tokens = normalised.split(RegExp(r'\s+'));

    // Check each category — match if the category name appears as a token
    // in the spoken text, or if the spoken text contains the category name
    // as a substring.
    for (final category in knownCategories) {
      final categoryLower = category.toLowerCase();

      // Exact token match (e.g. spoken "seafood recipes" contains "seafood").
      if (tokens.contains(categoryLower)) {
        return CategoryQuery(category);
      }

      // Substring match for multi-word input (e.g. "show me some beef").
      if (normalised.contains(categoryLower)) {
        return CategoryQuery(category);
      }
    }

    // No category matched — treat the entire spoken text as a keyword search.
    return KeywordQuery(spokenText.trim());
  }
}
