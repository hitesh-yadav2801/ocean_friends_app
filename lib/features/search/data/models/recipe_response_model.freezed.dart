// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeResponseModel {

@JsonKey(name: 'meals') List<RecipeModel>? get meals;
/// Create a copy of RecipeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeResponseModelCopyWith<RecipeResponseModel> get copyWith => _$RecipeResponseModelCopyWithImpl<RecipeResponseModel>(this as RecipeResponseModel, _$identity);

  /// Serializes this RecipeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeResponseModel&&const DeepCollectionEquality().equals(other.meals, meals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(meals));

@override
String toString() {
  return 'RecipeResponseModel(meals: $meals)';
}


}

/// @nodoc
abstract mixin class $RecipeResponseModelCopyWith<$Res>  {
  factory $RecipeResponseModelCopyWith(RecipeResponseModel value, $Res Function(RecipeResponseModel) _then) = _$RecipeResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'meals') List<RecipeModel>? meals
});




}
/// @nodoc
class _$RecipeResponseModelCopyWithImpl<$Res>
    implements $RecipeResponseModelCopyWith<$Res> {
  _$RecipeResponseModelCopyWithImpl(this._self, this._then);

  final RecipeResponseModel _self;
  final $Res Function(RecipeResponseModel) _then;

/// Create a copy of RecipeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meals = freezed,}) {
  return _then(_self.copyWith(
meals: freezed == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as List<RecipeModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeResponseModel].
extension RecipeResponseModelPatterns on RecipeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RecipeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'meals')  List<RecipeModel>? meals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeResponseModel() when $default != null:
return $default(_that.meals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'meals')  List<RecipeModel>? meals)  $default,) {final _that = this;
switch (_that) {
case _RecipeResponseModel():
return $default(_that.meals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'meals')  List<RecipeModel>? meals)?  $default,) {final _that = this;
switch (_that) {
case _RecipeResponseModel() when $default != null:
return $default(_that.meals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeResponseModel implements RecipeResponseModel {
  const _RecipeResponseModel({@JsonKey(name: 'meals') final  List<RecipeModel>? meals}): _meals = meals;
  factory _RecipeResponseModel.fromJson(Map<String, dynamic> json) => _$RecipeResponseModelFromJson(json);

 final  List<RecipeModel>? _meals;
@override@JsonKey(name: 'meals') List<RecipeModel>? get meals {
  final value = _meals;
  if (value == null) return null;
  if (_meals is EqualUnmodifiableListView) return _meals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RecipeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeResponseModelCopyWith<_RecipeResponseModel> get copyWith => __$RecipeResponseModelCopyWithImpl<_RecipeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeResponseModel&&const DeepCollectionEquality().equals(other._meals, _meals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_meals));

@override
String toString() {
  return 'RecipeResponseModel(meals: $meals)';
}


}

/// @nodoc
abstract mixin class _$RecipeResponseModelCopyWith<$Res> implements $RecipeResponseModelCopyWith<$Res> {
  factory _$RecipeResponseModelCopyWith(_RecipeResponseModel value, $Res Function(_RecipeResponseModel) _then) = __$RecipeResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'meals') List<RecipeModel>? meals
});




}
/// @nodoc
class __$RecipeResponseModelCopyWithImpl<$Res>
    implements _$RecipeResponseModelCopyWith<$Res> {
  __$RecipeResponseModelCopyWithImpl(this._self, this._then);

  final _RecipeResponseModel _self;
  final $Res Function(_RecipeResponseModel) _then;

/// Create a copy of RecipeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meals = freezed,}) {
  return _then(_RecipeResponseModel(
meals: freezed == meals ? _self._meals : meals // ignore: cast_nullable_to_non_nullable
as List<RecipeModel>?,
  ));
}


}

// dart format on
