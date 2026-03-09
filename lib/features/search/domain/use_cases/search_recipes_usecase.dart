import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/core/usecase/usecase.dart';
import 'package:ocean_friends_app/features/search/domain/entities/recipe.dart';
import 'package:ocean_friends_app/features/search/domain/repositories/recipe_repository.dart';

/// UseCase to search meal recipes by a keyword query.
@lazySingleton
class SearchRecipesUseCase
    implements UseCase<List<Recipe>, SearchRecipesParams> {
  const SearchRecipesUseCase(this.repository);

  final RecipeRepository repository;

  @override
  Future<AppResult<List<Recipe>>> call(SearchRecipesParams params) {
    return repository.searchRecipes(params.query);
  }
}

class SearchRecipesParams extends Equatable {
  const SearchRecipesParams(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
