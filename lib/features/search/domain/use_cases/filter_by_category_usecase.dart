import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/core/usecase/usecase.dart';
import 'package:ocean_friends_app/features/search/domain/entities/recipe.dart';
import 'package:ocean_friends_app/features/search/domain/repositories/recipe_repository.dart';

/// UseCase to filter meal recipes by a specific category.
@lazySingleton
class FilterByCategoryUseCase
    implements UseCase<List<Recipe>, FilterByCategoryParams> {
  const FilterByCategoryUseCase(this.repository);

  final RecipeRepository repository;

  @override
  Future<AppResult<List<Recipe>>> call(FilterByCategoryParams params) {
    return repository.filterByCategory(params.category);
  }
}

class FilterByCategoryParams extends Equatable {
  const FilterByCategoryParams(this.category);

  final String category;

  @override
  List<Object> get props => [category];
}
