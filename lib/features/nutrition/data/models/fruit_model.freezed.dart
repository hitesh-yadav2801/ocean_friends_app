// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fruit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FruitModel {

 String get name; int get id; String get family; String get order; String get genus; NutritionModel get nutritions;
/// Create a copy of FruitModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FruitModelCopyWith<FruitModel> get copyWith => _$FruitModelCopyWithImpl<FruitModel>(this as FruitModel, _$identity);

  /// Serializes this FruitModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FruitModel&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.family, family) || other.family == family)&&(identical(other.order, order) || other.order == order)&&(identical(other.genus, genus) || other.genus == genus)&&(identical(other.nutritions, nutritions) || other.nutritions == nutritions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id,family,order,genus,nutritions);

@override
String toString() {
  return 'FruitModel(name: $name, id: $id, family: $family, order: $order, genus: $genus, nutritions: $nutritions)';
}


}

/// @nodoc
abstract mixin class $FruitModelCopyWith<$Res>  {
  factory $FruitModelCopyWith(FruitModel value, $Res Function(FruitModel) _then) = _$FruitModelCopyWithImpl;
@useResult
$Res call({
 String name, int id, String family, String order, String genus, NutritionModel nutritions
});


$NutritionModelCopyWith<$Res> get nutritions;

}
/// @nodoc
class _$FruitModelCopyWithImpl<$Res>
    implements $FruitModelCopyWith<$Res> {
  _$FruitModelCopyWithImpl(this._self, this._then);

  final FruitModel _self;
  final $Res Function(FruitModel) _then;

/// Create a copy of FruitModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? id = null,Object? family = null,Object? order = null,Object? genus = null,Object? nutritions = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as String,genus: null == genus ? _self.genus : genus // ignore: cast_nullable_to_non_nullable
as String,nutritions: null == nutritions ? _self.nutritions : nutritions // ignore: cast_nullable_to_non_nullable
as NutritionModel,
  ));
}
/// Create a copy of FruitModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionModelCopyWith<$Res> get nutritions {
  
  return $NutritionModelCopyWith<$Res>(_self.nutritions, (value) {
    return _then(_self.copyWith(nutritions: value));
  });
}
}


/// Adds pattern-matching-related methods to [FruitModel].
extension FruitModelPatterns on FruitModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FruitModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FruitModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FruitModel value)  $default,){
final _that = this;
switch (_that) {
case _FruitModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FruitModel value)?  $default,){
final _that = this;
switch (_that) {
case _FruitModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int id,  String family,  String order,  String genus,  NutritionModel nutritions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FruitModel() when $default != null:
return $default(_that.name,_that.id,_that.family,_that.order,_that.genus,_that.nutritions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int id,  String family,  String order,  String genus,  NutritionModel nutritions)  $default,) {final _that = this;
switch (_that) {
case _FruitModel():
return $default(_that.name,_that.id,_that.family,_that.order,_that.genus,_that.nutritions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int id,  String family,  String order,  String genus,  NutritionModel nutritions)?  $default,) {final _that = this;
switch (_that) {
case _FruitModel() when $default != null:
return $default(_that.name,_that.id,_that.family,_that.order,_that.genus,_that.nutritions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FruitModel extends FruitModel {
  const _FruitModel({required this.name, required this.id, required this.family, required this.order, required this.genus, required this.nutritions}): super._();
  factory _FruitModel.fromJson(Map<String, dynamic> json) => _$FruitModelFromJson(json);

@override final  String name;
@override final  int id;
@override final  String family;
@override final  String order;
@override final  String genus;
@override final  NutritionModel nutritions;

/// Create a copy of FruitModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FruitModelCopyWith<_FruitModel> get copyWith => __$FruitModelCopyWithImpl<_FruitModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FruitModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FruitModel&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.family, family) || other.family == family)&&(identical(other.order, order) || other.order == order)&&(identical(other.genus, genus) || other.genus == genus)&&(identical(other.nutritions, nutritions) || other.nutritions == nutritions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id,family,order,genus,nutritions);

@override
String toString() {
  return 'FruitModel(name: $name, id: $id, family: $family, order: $order, genus: $genus, nutritions: $nutritions)';
}


}

/// @nodoc
abstract mixin class _$FruitModelCopyWith<$Res> implements $FruitModelCopyWith<$Res> {
  factory _$FruitModelCopyWith(_FruitModel value, $Res Function(_FruitModel) _then) = __$FruitModelCopyWithImpl;
@override @useResult
$Res call({
 String name, int id, String family, String order, String genus, NutritionModel nutritions
});


@override $NutritionModelCopyWith<$Res> get nutritions;

}
/// @nodoc
class __$FruitModelCopyWithImpl<$Res>
    implements _$FruitModelCopyWith<$Res> {
  __$FruitModelCopyWithImpl(this._self, this._then);

  final _FruitModel _self;
  final $Res Function(_FruitModel) _then;

/// Create a copy of FruitModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? id = null,Object? family = null,Object? order = null,Object? genus = null,Object? nutritions = null,}) {
  return _then(_FruitModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as String,genus: null == genus ? _self.genus : genus // ignore: cast_nullable_to_non_nullable
as String,nutritions: null == nutritions ? _self.nutritions : nutritions // ignore: cast_nullable_to_non_nullable
as NutritionModel,
  ));
}

/// Create a copy of FruitModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionModelCopyWith<$Res> get nutritions {
  
  return $NutritionModelCopyWith<$Res>(_self.nutritions, (value) {
    return _then(_self.copyWith(nutritions: value));
  });
}
}

// dart format on
