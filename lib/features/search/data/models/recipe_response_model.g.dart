// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeResponseModel _$RecipeResponseModelFromJson(Map<String, dynamic> json) =>
    _RecipeResponseModel(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeResponseModelToJson(
  _RecipeResponseModel instance,
) => <String, dynamic>{'meals': instance.meals};
