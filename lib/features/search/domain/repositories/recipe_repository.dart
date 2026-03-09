import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/features/search/domain/entities/recipe.dart';

/// Interface for the Recipe Repository.
abstract class RecipeRepository {
  /// Searches recipes by keyword.
  Future<AppResult<List<Recipe>>> searchRecipes(String query);

  /// Filters recipes by category name.
  Future<AppResult<List<Recipe>>> filterByCategory(String category);
}
