// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryResponseModel _$CategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => _CategoryResponseModel(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryResponseModelToJson(
  _CategoryResponseModel instance,
) => <String, dynamic>{'categories': instance.categories};
