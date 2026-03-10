// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryResponseModel {

@JsonKey(name: 'categories') List<CategoryModel> get categories;
/// Create a copy of CategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryResponseModelCopyWith<CategoryResponseModel> get copyWith => _$CategoryResponseModelCopyWithImpl<CategoryResponseModel>(this as CategoryResponseModel, _$identity);

  /// Serializes this CategoryResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryResponseModel&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'CategoryResponseModel(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $CategoryResponseModelCopyWith<$Res>  {
  factory $CategoryResponseModelCopyWith(CategoryResponseModel value, $Res Function(CategoryResponseModel) _then) = _$CategoryResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'categories') List<CategoryModel> categories
});




}
/// @nodoc
class _$CategoryResponseModelCopyWithImpl<$Res>
    implements $CategoryResponseModelCopyWith<$Res> {
  _$CategoryResponseModelCopyWithImpl(this._self, this._then);

  final CategoryResponseModel _self;
  final $Res Function(CategoryResponseModel) _then;

/// Create a copy of CategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryResponseModel].
extension CategoryResponseModelPatterns on CategoryResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'categories')  List<CategoryModel> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryResponseModel() when $default != null:
return $default(_that.categories);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'categories')  List<CategoryModel> categories)  $default,) {final _that = this;
switch (_that) {
case _CategoryResponseModel():
return $default(_that.categories);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'categories')  List<CategoryModel> categories)?  $default,) {final _that = this;
switch (_that) {
case _CategoryResponseModel() when $default != null:
return $default(_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryResponseModel implements CategoryResponseModel {
  const _CategoryResponseModel({@JsonKey(name: 'categories') required final  List<CategoryModel> categories}): _categories = categories;
  factory _CategoryResponseModel.fromJson(Map<String, dynamic> json) => _$CategoryResponseModelFromJson(json);

 final  List<CategoryModel> _categories;
@override@JsonKey(name: 'categories') List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryResponseModelCopyWith<_CategoryResponseModel> get copyWith => __$CategoryResponseModelCopyWithImpl<_CategoryResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryResponseModel&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoryResponseModel(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$CategoryResponseModelCopyWith<$Res> implements $CategoryResponseModelCopyWith<$Res> {
  factory _$CategoryResponseModelCopyWith(_CategoryResponseModel value, $Res Function(_CategoryResponseModel) _then) = __$CategoryResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'categories') List<CategoryModel> categories
});




}
/// @nodoc
class __$CategoryResponseModelCopyWithImpl<$Res>
    implements _$CategoryResponseModelCopyWith<$Res> {
  __$CategoryResponseModelCopyWithImpl(this._self, this._then);

  final _CategoryResponseModel _self;
  final $Res Function(_CategoryResponseModel) _then;

/// Create a copy of CategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_CategoryResponseModel(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

// dart format on
