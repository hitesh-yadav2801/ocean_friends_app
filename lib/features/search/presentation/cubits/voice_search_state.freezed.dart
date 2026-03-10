// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoiceSearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoiceSearchState()';
}


}

/// @nodoc
class $VoiceSearchStateCopyWith<$Res>  {
$VoiceSearchStateCopyWith(VoiceSearchState _, $Res Function(VoiceSearchState) __);
}


/// Adds pattern-matching-related methods to [VoiceSearchState].
extension VoiceSearchStatePatterns on VoiceSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VoiceSearchIdle value)?  idle,TResult Function( VoiceSearchListening value)?  listening,TResult Function( VoiceSearchDone value)?  done,TResult Function( VoiceSearchError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VoiceSearchIdle() when idle != null:
return idle(_that);case VoiceSearchListening() when listening != null:
return listening(_that);case VoiceSearchDone() when done != null:
return done(_that);case VoiceSearchError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VoiceSearchIdle value)  idle,required TResult Function( VoiceSearchListening value)  listening,required TResult Function( VoiceSearchDone value)  done,required TResult Function( VoiceSearchError value)  error,}){
final _that = this;
switch (_that) {
case VoiceSearchIdle():
return idle(_that);case VoiceSearchListening():
return listening(_that);case VoiceSearchDone():
return done(_that);case VoiceSearchError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VoiceSearchIdle value)?  idle,TResult? Function( VoiceSearchListening value)?  listening,TResult? Function( VoiceSearchDone value)?  done,TResult? Function( VoiceSearchError value)?  error,}){
final _that = this;
switch (_that) {
case VoiceSearchIdle() when idle != null:
return idle(_that);case VoiceSearchListening() when listening != null:
return listening(_that);case VoiceSearchDone() when done != null:
return done(_that);case VoiceSearchError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( String partialText)?  listening,TResult Function( String recognisedText)?  done,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VoiceSearchIdle() when idle != null:
return idle();case VoiceSearchListening() when listening != null:
return listening(_that.partialText);case VoiceSearchDone() when done != null:
return done(_that.recognisedText);case VoiceSearchError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( String partialText)  listening,required TResult Function( String recognisedText)  done,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case VoiceSearchIdle():
return idle();case VoiceSearchListening():
return listening(_that.partialText);case VoiceSearchDone():
return done(_that.recognisedText);case VoiceSearchError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( String partialText)?  listening,TResult? Function( String recognisedText)?  done,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case VoiceSearchIdle() when idle != null:
return idle();case VoiceSearchListening() when listening != null:
return listening(_that.partialText);case VoiceSearchDone() when done != null:
return done(_that.recognisedText);case VoiceSearchError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class VoiceSearchIdle implements VoiceSearchState {
  const VoiceSearchIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSearchIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoiceSearchState.idle()';
}


}




/// @nodoc


class VoiceSearchListening implements VoiceSearchState {
  const VoiceSearchListening({this.partialText = ''});
  

@JsonKey() final  String partialText;

/// Create a copy of VoiceSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceSearchListeningCopyWith<VoiceSearchListening> get copyWith => _$VoiceSearchListeningCopyWithImpl<VoiceSearchListening>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSearchListening&&(identical(other.partialText, partialText) || other.partialText == partialText));
}


@override
int get hashCode => Object.hash(runtimeType,partialText);

@override
String toString() {
  return 'VoiceSearchState.listening(partialText: $partialText)';
}


}

/// @nodoc
abstract mixin class $VoiceSearchListeningCopyWith<$Res> implements $VoiceSearchStateCopyWith<$Res> {
  factory $VoiceSearchListeningCopyWith(VoiceSearchListening value, $Res Function(VoiceSearchListening) _then) = _$VoiceSearchListeningCopyWithImpl;
@useResult
$Res call({
 String partialText
});




}
/// @nodoc
class _$VoiceSearchListeningCopyWithImpl<$Res>
    implements $VoiceSearchListeningCopyWith<$Res> {
  _$VoiceSearchListeningCopyWithImpl(this._self, this._then);

  final VoiceSearchListening _self;
  final $Res Function(VoiceSearchListening) _then;

/// Create a copy of VoiceSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partialText = null,}) {
  return _then(VoiceSearchListening(
partialText: null == partialText ? _self.partialText : partialText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VoiceSearchDone implements VoiceSearchState {
  const VoiceSearchDone(this.recognisedText);
  

 final  String recognisedText;

/// Create a copy of VoiceSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceSearchDoneCopyWith<VoiceSearchDone> get copyWith => _$VoiceSearchDoneCopyWithImpl<VoiceSearchDone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSearchDone&&(identical(other.recognisedText, recognisedText) || other.recognisedText == recognisedText));
}


@override
int get hashCode => Object.hash(runtimeType,recognisedText);

@override
String toString() {
  return 'VoiceSearchState.done(recognisedText: $recognisedText)';
}


}

/// @nodoc
abstract mixin class $VoiceSearchDoneCopyWith<$Res> implements $VoiceSearchStateCopyWith<$Res> {
  factory $VoiceSearchDoneCopyWith(VoiceSearchDone value, $Res Function(VoiceSearchDone) _then) = _$VoiceSearchDoneCopyWithImpl;
@useResult
$Res call({
 String recognisedText
});




}
/// @nodoc
class _$VoiceSearchDoneCopyWithImpl<$Res>
    implements $VoiceSearchDoneCopyWith<$Res> {
  _$VoiceSearchDoneCopyWithImpl(this._self, this._then);

  final VoiceSearchDone _self;
  final $Res Function(VoiceSearchDone) _then;

/// Create a copy of VoiceSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recognisedText = null,}) {
  return _then(VoiceSearchDone(
null == recognisedText ? _self.recognisedText : recognisedText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VoiceSearchError implements VoiceSearchState {
  const VoiceSearchError(this.message);
  

 final  String message;

/// Create a copy of VoiceSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceSearchErrorCopyWith<VoiceSearchError> get copyWith => _$VoiceSearchErrorCopyWithImpl<VoiceSearchError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSearchError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VoiceSearchState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $VoiceSearchErrorCopyWith<$Res> implements $VoiceSearchStateCopyWith<$Res> {
  factory $VoiceSearchErrorCopyWith(VoiceSearchError value, $Res Function(VoiceSearchError) _then) = _$VoiceSearchErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VoiceSearchErrorCopyWithImpl<$Res>
    implements $VoiceSearchErrorCopyWith<$Res> {
  _$VoiceSearchErrorCopyWithImpl(this._self, this._then);

  final VoiceSearchError _self;
  final $Res Function(VoiceSearchError) _then;

/// Create a copy of VoiceSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VoiceSearchError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
