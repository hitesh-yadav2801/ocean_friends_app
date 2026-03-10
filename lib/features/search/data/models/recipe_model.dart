import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ocean_friends_app/features/search/domain/entities/recipe.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
abstract class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    required String idMeal,
    required String strMeal,
    required String strMealThumb,
  }) = _RecipeModel;

  const RecipeModel._();

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Recipe toEntity() {
    return Recipe(
      idMeal: idMeal,
      strMeal: strMeal,
      strMealThumb: strMealThumb,
    );
  }
}
