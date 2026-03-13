import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ocean_friends_app/features/nutrition/data/models/nutrition_model.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/fruit.dart';

part 'fruit_model.freezed.dart';
part 'fruit_model.g.dart';

@freezed
abstract class FruitModel with _$FruitModel {
  const factory FruitModel({
    required String name,
    required int id,
    required String family,
    required String order,
    required String genus,
    required NutritionModel nutritions,
  }) = _FruitModel;

  const FruitModel._();

  factory FruitModel.fromJson(Map<String, dynamic> json) =>
      _$FruitModelFromJson(json);

  Fruit toEntity() {
    return Fruit(
      id: id,
      name: name,
      family: family,
      order: order,
      genus: genus,
      nutrition: nutritions.toEntity(),
    );
  }
}
