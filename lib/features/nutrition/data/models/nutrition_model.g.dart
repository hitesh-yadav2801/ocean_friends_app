// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) =>
    _NutritionModel(
      calories: (json['calories'] as num?)?.toDouble() ?? 0,
      fat: (json['fat'] as num?)?.toDouble() ?? 0,
      sugar: (json['sugar'] as num?)?.toDouble() ?? 0,
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble() ?? 0,
      protein: (json['protein'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$NutritionModelToJson(_NutritionModel instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'fat': instance.fat,
      'sugar': instance.sugar,
      'carbohydrates': instance.carbohydrates,
      'protein': instance.protein,
    };
