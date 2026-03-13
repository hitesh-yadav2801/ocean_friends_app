// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionModel {

@JsonKey(defaultValue: 0) double get calories;@JsonKey(defaultValue: 0) double get fat;@JsonKey(defaultValue: 0) double get sugar;@JsonKey(defaultValue: 0) double get carbohydrates;@JsonKey(defaultValue: 0) double get protein;
/// Create a copy of NutritionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionModelCopyWith<NutritionModel> get copyWith => _$NutritionModelCopyWithImpl<NutritionModel>(this as NutritionModel, _$identity);

  /// Serializes this NutritionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionModel&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.sugar, sugar) || other.sugar == sugar)&&(identical(other.carbohydrates, carbohydrates) || other.carbohydrates == carbohydrates)&&(identical(other.protein, protein) || other.protein == protein));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,fat,sugar,carbohydrates,protein);

@override
String toString() {
  return 'NutritionModel(calories: $calories, fat: $fat, sugar: $sugar, carbohydrates: $carbohydrates, protein: $protein)';
}


}

/// @nodoc
abstract mixin class $NutritionModelCopyWith<$Res>  {
  factory $NutritionModelCopyWith(NutritionModel value, $Res Function(NutritionModel) _then) = _$NutritionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: 0) double calories,@JsonKey(defaultValue: 0) double fat,@JsonKey(defaultValue: 0) double sugar,@JsonKey(defaultValue: 0) double carbohydrates,@JsonKey(defaultValue: 0) double protein
});




}
/// @nodoc
class _$NutritionModelCopyWithImpl<$Res>
    implements $NutritionModelCopyWith<$Res> {
  _$NutritionModelCopyWithImpl(this._self, this._then);

  final NutritionModel _self;
  final $Res Function(NutritionModel) _then;

/// Create a copy of NutritionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calories = null,Object? fat = null,Object? sugar = null,Object? carbohydrates = null,Object? protein = null,}) {
  return _then(_self.copyWith(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,fat: null == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double,sugar: null == sugar ? _self.sugar : sugar // ignore: cast_nullable_to_non_nullable
as double,carbohydrates: null == carbohydrates ? _self.carbohydrates : carbohydrates // ignore: cast_nullable_to_non_nullable
as double,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionModel].
extension NutritionModelPatterns on NutritionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionModel value)  $default,){
final _that = this;
switch (_that) {
case _NutritionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionModel value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: 0)  double calories, @JsonKey(defaultValue: 0)  double fat, @JsonKey(defaultValue: 0)  double sugar, @JsonKey(defaultValue: 0)  double carbohydrates, @JsonKey(defaultValue: 0)  double protein)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionModel() when $default != null:
return $default(_that.calories,_that.fat,_that.sugar,_that.carbohydrates,_that.protein);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: 0)  double calories, @JsonKey(defaultValue: 0)  double fat, @JsonKey(defaultValue: 0)  double sugar, @JsonKey(defaultValue: 0)  double carbohydrates, @JsonKey(defaultValue: 0)  double protein)  $default,) {final _that = this;
switch (_that) {
case _NutritionModel():
return $default(_that.calories,_that.fat,_that.sugar,_that.carbohydrates,_that.protein);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: 0)  double calories, @JsonKey(defaultValue: 0)  double fat, @JsonKey(defaultValue: 0)  double sugar, @JsonKey(defaultValue: 0)  double carbohydrates, @JsonKey(defaultValue: 0)  double protein)?  $default,) {final _that = this;
switch (_that) {
case _NutritionModel() when $default != null:
return $default(_that.calories,_that.fat,_that.sugar,_that.carbohydrates,_that.protein);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutritionModel extends NutritionModel {
  const _NutritionModel({@JsonKey(defaultValue: 0) required this.calories, @JsonKey(defaultValue: 0) required this.fat, @JsonKey(defaultValue: 0) required this.sugar, @JsonKey(defaultValue: 0) required this.carbohydrates, @JsonKey(defaultValue: 0) required this.protein}): super._();
  factory _NutritionModel.fromJson(Map<String, dynamic> json) => _$NutritionModelFromJson(json);

@override@JsonKey(defaultValue: 0) final  double calories;
@override@JsonKey(defaultValue: 0) final  double fat;
@override@JsonKey(defaultValue: 0) final  double sugar;
@override@JsonKey(defaultValue: 0) final  double carbohydrates;
@override@JsonKey(defaultValue: 0) final  double protein;

/// Create a copy of NutritionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionModelCopyWith<_NutritionModel> get copyWith => __$NutritionModelCopyWithImpl<_NutritionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutritionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionModel&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.sugar, sugar) || other.sugar == sugar)&&(identical(other.carbohydrates, carbohydrates) || other.carbohydrates == carbohydrates)&&(identical(other.protein, protein) || other.protein == protein));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,fat,sugar,carbohydrates,protein);

@override
String toString() {
  return 'NutritionModel(calories: $calories, fat: $fat, sugar: $sugar, carbohydrates: $carbohydrates, protein: $protein)';
}


}

/// @nodoc
abstract mixin class _$NutritionModelCopyWith<$Res> implements $NutritionModelCopyWith<$Res> {
  factory _$NutritionModelCopyWith(_NutritionModel value, $Res Function(_NutritionModel) _then) = __$NutritionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: 0) double calories,@JsonKey(defaultValue: 0) double fat,@JsonKey(defaultValue: 0) double sugar,@JsonKey(defaultValue: 0) double carbohydrates,@JsonKey(defaultValue: 0) double protein
});




}
/// @nodoc
class __$NutritionModelCopyWithImpl<$Res>
    implements _$NutritionModelCopyWith<$Res> {
  __$NutritionModelCopyWithImpl(this._self, this._then);

  final _NutritionModel _self;
  final $Res Function(_NutritionModel) _then;

/// Create a copy of NutritionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calories = null,Object? fat = null,Object? sugar = null,Object? carbohydrates = null,Object? protein = null,}) {
  return _then(_NutritionModel(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,fat: null == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double,sugar: null == sugar ? _self.sugar : sugar // ignore: cast_nullable_to_non_nullable
as double,carbohydrates: null == carbohydrates ? _self.carbohydrates : carbohydrates // ignore: cast_nullable_to_non_nullable
as double,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
