import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ocean_friends_app/features/search/data/models/recipe_model.dart';

part 'recipe_response_model.freezed.dart';
part 'recipe_response_model.g.dart';

@freezed
abstract class RecipeResponseModel with _$RecipeResponseModel {
  const factory RecipeResponseModel({
    @JsonKey(name: 'meals') List<RecipeModel>? meals,
  }) = _RecipeResponseModel;

  factory RecipeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseModelFromJson(json);
}
