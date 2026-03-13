// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FruitModel _$FruitModelFromJson(Map<String, dynamic> json) => _FruitModel(
  name: json['name'] as String,
  id: (json['id'] as num).toInt(),
  family: json['family'] as String,
  order: json['order'] as String,
  genus: json['genus'] as String,
  nutritions: NutritionModel.fromJson(
    json['nutritions'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$FruitModelToJson(_FruitModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'family': instance.family,
      'order': instance.order,
      'genus': instance.genus,
      'nutritions': instance.nutritions,
    };
