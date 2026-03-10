import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ocean_friends_app/features/home/data/models/category_model.dart';

part 'category_response_model.freezed.dart';
part 'category_response_model.g.dart';

@freezed
abstract class CategoryResponseModel with _$CategoryResponseModel {
  const factory CategoryResponseModel({
    @JsonKey(name: 'categories') required List<CategoryModel> categories,
  }) = _CategoryResponseModel;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);
}
