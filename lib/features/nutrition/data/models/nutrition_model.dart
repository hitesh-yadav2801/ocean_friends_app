import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ocean_friends_app/features/nutrition/domain/entities/nutrition_values.dart';

part 'nutrition_model.freezed.dart';
part 'nutrition_model.g.dart';

@freezed
abstract class NutritionModel with _$NutritionModel {
  const factory NutritionModel({
    @JsonKey(defaultValue: 0) required double calories,
    @JsonKey(defaultValue: 0) required double fat,
    @JsonKey(defaultValue: 0) required double sugar,
    @JsonKey(defaultValue: 0) required double carbohydrates,
    @JsonKey(defaultValue: 0) required double protein,
  }) = _NutritionModel;

  const NutritionModel._();

  factory NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(json);

  NutritionValues toEntity() {
    return NutritionValues(
      calories: calories,
      fat: fat,
      sugar: sugar,
      carbohydrates: carbohydrates,
      protein: protein,
    );
  }
}
