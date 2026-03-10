import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/features/search/domain/entities/recipe.dart';

part 'recipe_list_state.freezed.dart';

@freezed
class RecipeListState with _$RecipeListState {
  const factory RecipeListState.initial() = _Initial;
  const factory RecipeListState.loading() = _Loading;
  const factory RecipeListState.loaded(List<Recipe> recipes) = _Loaded;
  const factory RecipeListState.error(Failure failure) = _Error;
}
