// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pod_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateOtpRequest {

@JsonKey(name: 'recipient_phone') String? get recipientPhone;
/// Create a copy of GenerateOtpRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateOtpRequestCopyWith<GenerateOtpRequest> get copyWith => _$GenerateOtpRequestCopyWithImpl<GenerateOtpRequest>(this as GenerateOtpRequest, _$identity);

  /// Serializes this GenerateOtpRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateOtpRequest&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientPhone);

@override
String toString() {
  return 'GenerateOtpRequest(recipientPhone: $recipientPhone)';
}


}

/// @nodoc
abstract mixin class $GenerateOtpRequestCopyWith<$Res>  {
  factory $GenerateOtpRequestCopyWith(GenerateOtpRequest value, $Res Function(GenerateOtpRequest) _then) = _$GenerateOtpRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'recipient_phone') String? recipientPhone
});




}
/// @nodoc
class _$GenerateOtpRequestCopyWithImpl<$Res>
    implements $GenerateOtpRequestCopyWith<$Res> {
  _$GenerateOtpRequestCopyWithImpl(this._self, this._then);

  final GenerateOtpRequest _self;
  final $Res Function(GenerateOtpRequest) _then;

/// Create a copy of GenerateOtpRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipientPhone = freezed,}) {
  return _then(_self.copyWith(
recipientPhone: freezed == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateOtpRequest].
extension GenerateOtpRequestPatterns on GenerateOtpRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateOtpRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateOtpRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateOtpRequest value)  $default,){
final _that = this;
switch (_that) {
case _GenerateOtpRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateOtpRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateOtpRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'recipient_phone')  String? recipientPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateOtpRequest() when $default != null:
return $default(_that.recipientPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'recipient_phone')  String? recipientPhone)  $default,) {final _that = this;
switch (_that) {
case _GenerateOtpRequest():
return $default(_that.recipientPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'recipient_phone')  String? recipientPhone)?  $default,) {final _that = this;
switch (_that) {
case _GenerateOtpRequest() when $default != null:
return $default(_that.recipientPhone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateOtpRequest implements GenerateOtpRequest {
  const _GenerateOtpRequest({@JsonKey(name: 'recipient_phone') this.recipientPhone});
  factory _GenerateOtpRequest.fromJson(Map<String, dynamic> json) => _$GenerateOtpRequestFromJson(json);

@override@JsonKey(name: 'recipient_phone') final  String? recipientPhone;

/// Create a copy of GenerateOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateOtpRequestCopyWith<_GenerateOtpRequest> get copyWith => __$GenerateOtpRequestCopyWithImpl<_GenerateOtpRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateOtpRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateOtpRequest&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientPhone);

@override
String toString() {
  return 'GenerateOtpRequest(recipientPhone: $recipientPhone)';
}


}

/// @nodoc
abstract mixin class _$GenerateOtpRequestCopyWith<$Res> implements $GenerateOtpRequestCopyWith<$Res> {
  factory _$GenerateOtpRequestCopyWith(_GenerateOtpRequest value, $Res Function(_GenerateOtpRequest) _then) = __$GenerateOtpRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'recipient_phone') String? recipientPhone
});




}
/// @nodoc
class __$GenerateOtpRequestCopyWithImpl<$Res>
    implements _$GenerateOtpRequestCopyWith<$Res> {
  __$GenerateOtpRequestCopyWithImpl(this._self, this._then);

  final _GenerateOtpRequest _self;
  final $Res Function(_GenerateOtpRequest) _then;

/// Create a copy of GenerateOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientPhone = freezed,}) {
  return _then(_GenerateOtpRequest(
recipientPhone: freezed == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GenerateOtpResponse {

@JsonKey(name: 'parcel_id') String get parcelId;@JsonKey(name: 'otp_sent') bool get otpSent;@JsonKey(name: 'expires_in') int get expiresIn; String? get message;
/// Create a copy of GenerateOtpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateOtpResponseCopyWith<GenerateOtpResponse> get copyWith => _$GenerateOtpResponseCopyWithImpl<GenerateOtpResponse>(this as GenerateOtpResponse, _$identity);

  /// Serializes this GenerateOtpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateOtpResponse&&(identical(other.parcelId, parcelId) || other.parcelId == parcelId)&&(identical(other.otpSent, otpSent) || other.otpSent == otpSent)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parcelId,otpSent,expiresIn,message);

@override
String toString() {
  return 'GenerateOtpResponse(parcelId: $parcelId, otpSent: $otpSent, expiresIn: $expiresIn, message: $message)';
}


}

/// @nodoc
abstract mixin class $GenerateOtpResponseCopyWith<$Res>  {
  factory $GenerateOtpResponseCopyWith(GenerateOtpResponse value, $Res Function(GenerateOtpResponse) _then) = _$GenerateOtpResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'parcel_id') String parcelId,@JsonKey(name: 'otp_sent') bool otpSent,@JsonKey(name: 'expires_in') int expiresIn, String? message
});




}
/// @nodoc
class _$GenerateOtpResponseCopyWithImpl<$Res>
    implements $GenerateOtpResponseCopyWith<$Res> {
  _$GenerateOtpResponseCopyWithImpl(this._self, this._then);

  final GenerateOtpResponse _self;
  final $Res Function(GenerateOtpResponse) _then;

/// Create a copy of GenerateOtpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parcelId = null,Object? otpSent = null,Object? expiresIn = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
parcelId: null == parcelId ? _self.parcelId : parcelId // ignore: cast_nullable_to_non_nullable
as String,otpSent: null == otpSent ? _self.otpSent : otpSent // ignore: cast_nullable_to_non_nullable
as bool,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateOtpResponse].
extension GenerateOtpResponsePatterns on GenerateOtpResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateOtpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateOtpResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateOtpResponse value)  $default,){
final _that = this;
switch (_that) {
case _GenerateOtpResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateOtpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateOtpResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'otp_sent')  bool otpSent, @JsonKey(name: 'expires_in')  int expiresIn,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateOtpResponse() when $default != null:
return $default(_that.parcelId,_that.otpSent,_that.expiresIn,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'otp_sent')  bool otpSent, @JsonKey(name: 'expires_in')  int expiresIn,  String? message)  $default,) {final _that = this;
switch (_that) {
case _GenerateOtpResponse():
return $default(_that.parcelId,_that.otpSent,_that.expiresIn,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'otp_sent')  bool otpSent, @JsonKey(name: 'expires_in')  int expiresIn,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _GenerateOtpResponse() when $default != null:
return $default(_that.parcelId,_that.otpSent,_that.expiresIn,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateOtpResponse implements GenerateOtpResponse {
  const _GenerateOtpResponse({@JsonKey(name: 'parcel_id') required this.parcelId, @JsonKey(name: 'otp_sent') required this.otpSent, @JsonKey(name: 'expires_in') required this.expiresIn, this.message});
  factory _GenerateOtpResponse.fromJson(Map<String, dynamic> json) => _$GenerateOtpResponseFromJson(json);

@override@JsonKey(name: 'parcel_id') final  String parcelId;
@override@JsonKey(name: 'otp_sent') final  bool otpSent;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override final  String? message;

/// Create a copy of GenerateOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateOtpResponseCopyWith<_GenerateOtpResponse> get copyWith => __$GenerateOtpResponseCopyWithImpl<_GenerateOtpResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateOtpResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateOtpResponse&&(identical(other.parcelId, parcelId) || other.parcelId == parcelId)&&(identical(other.otpSent, otpSent) || other.otpSent == otpSent)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parcelId,otpSent,expiresIn,message);

@override
String toString() {
  return 'GenerateOtpResponse(parcelId: $parcelId, otpSent: $otpSent, expiresIn: $expiresIn, message: $message)';
}


}

/// @nodoc
abstract mixin class _$GenerateOtpResponseCopyWith<$Res> implements $GenerateOtpResponseCopyWith<$Res> {
  factory _$GenerateOtpResponseCopyWith(_GenerateOtpResponse value, $Res Function(_GenerateOtpResponse) _then) = __$GenerateOtpResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'parcel_id') String parcelId,@JsonKey(name: 'otp_sent') bool otpSent,@JsonKey(name: 'expires_in') int expiresIn, String? message
});




}
/// @nodoc
class __$GenerateOtpResponseCopyWithImpl<$Res>
    implements _$GenerateOtpResponseCopyWith<$Res> {
  __$GenerateOtpResponseCopyWithImpl(this._self, this._then);

  final _GenerateOtpResponse _self;
  final $Res Function(_GenerateOtpResponse) _then;

/// Create a copy of GenerateOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parcelId = null,Object? otpSent = null,Object? expiresIn = null,Object? message = freezed,}) {
  return _then(_GenerateOtpResponse(
parcelId: null == parcelId ? _self.parcelId : parcelId // ignore: cast_nullable_to_non_nullable
as String,otpSent: null == otpSent ? _self.otpSent : otpSent // ignore: cast_nullable_to_non_nullable
as bool,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VerifyOtpRequest {

 String get otp;
/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpRequestCopyWith<VerifyOtpRequest> get copyWith => _$VerifyOtpRequestCopyWithImpl<VerifyOtpRequest>(this as VerifyOtpRequest, _$identity);

  /// Serializes this VerifyOtpRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpRequest&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString() {
  return 'VerifyOtpRequest(otp: $otp)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpRequestCopyWith<$Res>  {
  factory $VerifyOtpRequestCopyWith(VerifyOtpRequest value, $Res Function(VerifyOtpRequest) _then) = _$VerifyOtpRequestCopyWithImpl;
@useResult
$Res call({
 String otp
});




}
/// @nodoc
class _$VerifyOtpRequestCopyWithImpl<$Res>
    implements $VerifyOtpRequestCopyWith<$Res> {
  _$VerifyOtpRequestCopyWithImpl(this._self, this._then);

  final VerifyOtpRequest _self;
  final $Res Function(VerifyOtpRequest) _then;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otp = null,}) {
  return _then(_self.copyWith(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpRequest].
extension VerifyOtpRequestPatterns on VerifyOtpRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpRequest value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpRequest value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
return $default(_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String otp)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpRequest():
return $default(_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String otp)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
return $default(_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpRequest implements VerifyOtpRequest {
  const _VerifyOtpRequest({required this.otp});
  factory _VerifyOtpRequest.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestFromJson(json);

@override final  String otp;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpRequestCopyWith<_VerifyOtpRequest> get copyWith => __$VerifyOtpRequestCopyWithImpl<_VerifyOtpRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpRequest&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString() {
  return 'VerifyOtpRequest(otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpRequestCopyWith<$Res> implements $VerifyOtpRequestCopyWith<$Res> {
  factory _$VerifyOtpRequestCopyWith(_VerifyOtpRequest value, $Res Function(_VerifyOtpRequest) _then) = __$VerifyOtpRequestCopyWithImpl;
@override @useResult
$Res call({
 String otp
});




}
/// @nodoc
class __$VerifyOtpRequestCopyWithImpl<$Res>
    implements _$VerifyOtpRequestCopyWith<$Res> {
  __$VerifyOtpRequestCopyWithImpl(this._self, this._then);

  final _VerifyOtpRequest _self;
  final $Res Function(_VerifyOtpRequest) _then;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otp = null,}) {
  return _then(_VerifyOtpRequest(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifyOtpResponse {

@JsonKey(name: 'parcel_id') String get parcelId; bool get verified; String? get message;
/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpResponseCopyWith<VerifyOtpResponse> get copyWith => _$VerifyOtpResponseCopyWithImpl<VerifyOtpResponse>(this as VerifyOtpResponse, _$identity);

  /// Serializes this VerifyOtpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpResponse&&(identical(other.parcelId, parcelId) || other.parcelId == parcelId)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parcelId,verified,message);

@override
String toString() {
  return 'VerifyOtpResponse(parcelId: $parcelId, verified: $verified, message: $message)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpResponseCopyWith<$Res>  {
  factory $VerifyOtpResponseCopyWith(VerifyOtpResponse value, $Res Function(VerifyOtpResponse) _then) = _$VerifyOtpResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'parcel_id') String parcelId, bool verified, String? message
});




}
/// @nodoc
class _$VerifyOtpResponseCopyWithImpl<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  _$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final VerifyOtpResponse _self;
  final $Res Function(VerifyOtpResponse) _then;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parcelId = null,Object? verified = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
parcelId: null == parcelId ? _self.parcelId : parcelId // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpResponse].
extension VerifyOtpResponsePatterns on VerifyOtpResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpResponse value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'parcel_id')  String parcelId,  bool verified,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that.parcelId,_that.verified,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'parcel_id')  String parcelId,  bool verified,  String? message)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponse():
return $default(_that.parcelId,_that.verified,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'parcel_id')  String parcelId,  bool verified,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that.parcelId,_that.verified,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpResponse implements VerifyOtpResponse {
  const _VerifyOtpResponse({@JsonKey(name: 'parcel_id') required this.parcelId, required this.verified, this.message});
  factory _VerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseFromJson(json);

@override@JsonKey(name: 'parcel_id') final  String parcelId;
@override final  bool verified;
@override final  String? message;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpResponseCopyWith<_VerifyOtpResponse> get copyWith => __$VerifyOtpResponseCopyWithImpl<_VerifyOtpResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpResponse&&(identical(other.parcelId, parcelId) || other.parcelId == parcelId)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parcelId,verified,message);

@override
String toString() {
  return 'VerifyOtpResponse(parcelId: $parcelId, verified: $verified, message: $message)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpResponseCopyWith<$Res> implements $VerifyOtpResponseCopyWith<$Res> {
  factory _$VerifyOtpResponseCopyWith(_VerifyOtpResponse value, $Res Function(_VerifyOtpResponse) _then) = __$VerifyOtpResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'parcel_id') String parcelId, bool verified, String? message
});




}
/// @nodoc
class __$VerifyOtpResponseCopyWithImpl<$Res>
    implements _$VerifyOtpResponseCopyWith<$Res> {
  __$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final _VerifyOtpResponse _self;
  final $Res Function(_VerifyOtpResponse) _then;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parcelId = null,Object? verified = null,Object? message = freezed,}) {
  return _then(_VerifyOtpResponse(
parcelId: null == parcelId ? _self.parcelId : parcelId // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SubmitPodRequest {

@JsonKey(name: 'photo_url') String? get photoUrl;@JsonKey(name: 'signature_url') String? get signatureUrl;@JsonKey(name: 'otp_verified') bool get otpVerified;@JsonKey(name: 'received_by_name') String get receivedByName;@JsonKey(name: 'received_by_relation') String get receivedByRelation;@JsonKey(name: 'delivery_notes') String? get deliveryNotes;@JsonKey(name: 'cod_collected') bool get codCollected;// Expected by backend for COD proof submission.
@JsonKey(name: 'cod_amount_received', includeIfNull: false) double? get codAmountReceived;// Kept for backwards compatibility; backend may ignore this.
@JsonKey(name: 'cod_amount', includeIfNull: false) double? get codAmount; double? get lat; double? get lng;@JsonKey(name: 'client_timestamp') String? get clientTimestamp;
/// Create a copy of SubmitPodRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitPodRequestCopyWith<SubmitPodRequest> get copyWith => _$SubmitPodRequestCopyWithImpl<SubmitPodRequest>(this as SubmitPodRequest, _$identity);

  /// Serializes this SubmitPodRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitPodRequest&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.signatureUrl, signatureUrl) || other.signatureUrl == signatureUrl)&&(identical(other.otpVerified, otpVerified) || other.otpVerified == otpVerified)&&(identical(other.receivedByName, receivedByName) || other.receivedByName == receivedByName)&&(identical(other.receivedByRelation, receivedByRelation) || other.receivedByRelation == receivedByRelation)&&(identical(other.deliveryNotes, deliveryNotes) || other.deliveryNotes == deliveryNotes)&&(identical(other.codCollected, codCollected) || other.codCollected == codCollected)&&(identical(other.codAmountReceived, codAmountReceived) || other.codAmountReceived == codAmountReceived)&&(identical(other.codAmount, codAmount) || other.codAmount == codAmount)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.clientTimestamp, clientTimestamp) || other.clientTimestamp == clientTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,photoUrl,signatureUrl,otpVerified,receivedByName,receivedByRelation,deliveryNotes,codCollected,codAmountReceived,codAmount,lat,lng,clientTimestamp);

@override
String toString() {
  return 'SubmitPodRequest(photoUrl: $photoUrl, signatureUrl: $signatureUrl, otpVerified: $otpVerified, receivedByName: $receivedByName, receivedByRelation: $receivedByRelation, deliveryNotes: $deliveryNotes, codCollected: $codCollected, codAmountReceived: $codAmountReceived, codAmount: $codAmount, lat: $lat, lng: $lng, clientTimestamp: $clientTimestamp)';
}


}

/// @nodoc
abstract mixin class $SubmitPodRequestCopyWith<$Res>  {
  factory $SubmitPodRequestCopyWith(SubmitPodRequest value, $Res Function(SubmitPodRequest) _then) = _$SubmitPodRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'signature_url') String? signatureUrl,@JsonKey(name: 'otp_verified') bool otpVerified,@JsonKey(name: 'received_by_name') String receivedByName,@JsonKey(name: 'received_by_relation') String receivedByRelation,@JsonKey(name: 'delivery_notes') String? deliveryNotes,@JsonKey(name: 'cod_collected') bool codCollected,@JsonKey(name: 'cod_amount_received', includeIfNull: false) double? codAmountReceived,@JsonKey(name: 'cod_amount', includeIfNull: false) double? codAmount, double? lat, double? lng,@JsonKey(name: 'client_timestamp') String? clientTimestamp
});




}
/// @nodoc
class _$SubmitPodRequestCopyWithImpl<$Res>
    implements $SubmitPodRequestCopyWith<$Res> {
  _$SubmitPodRequestCopyWithImpl(this._self, this._then);

  final SubmitPodRequest _self;
  final $Res Function(SubmitPodRequest) _then;

/// Create a copy of SubmitPodRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photoUrl = freezed,Object? signatureUrl = freezed,Object? otpVerified = null,Object? receivedByName = null,Object? receivedByRelation = null,Object? deliveryNotes = freezed,Object? codCollected = null,Object? codAmountReceived = freezed,Object? codAmount = freezed,Object? lat = freezed,Object? lng = freezed,Object? clientTimestamp = freezed,}) {
  return _then(_self.copyWith(
photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,signatureUrl: freezed == signatureUrl ? _self.signatureUrl : signatureUrl // ignore: cast_nullable_to_non_nullable
as String?,otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,receivedByName: null == receivedByName ? _self.receivedByName : receivedByName // ignore: cast_nullable_to_non_nullable
as String,receivedByRelation: null == receivedByRelation ? _self.receivedByRelation : receivedByRelation // ignore: cast_nullable_to_non_nullable
as String,deliveryNotes: freezed == deliveryNotes ? _self.deliveryNotes : deliveryNotes // ignore: cast_nullable_to_non_nullable
as String?,codCollected: null == codCollected ? _self.codCollected : codCollected // ignore: cast_nullable_to_non_nullable
as bool,codAmountReceived: freezed == codAmountReceived ? _self.codAmountReceived : codAmountReceived // ignore: cast_nullable_to_non_nullable
as double?,codAmount: freezed == codAmount ? _self.codAmount : codAmount // ignore: cast_nullable_to_non_nullable
as double?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,clientTimestamp: freezed == clientTimestamp ? _self.clientTimestamp : clientTimestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitPodRequest].
extension SubmitPodRequestPatterns on SubmitPodRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitPodRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitPodRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitPodRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubmitPodRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitPodRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitPodRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'signature_url')  String? signatureUrl, @JsonKey(name: 'otp_verified')  bool otpVerified, @JsonKey(name: 'received_by_name')  String receivedByName, @JsonKey(name: 'received_by_relation')  String receivedByRelation, @JsonKey(name: 'delivery_notes')  String? deliveryNotes, @JsonKey(name: 'cod_collected')  bool codCollected, @JsonKey(name: 'cod_amount_received', includeIfNull: false)  double? codAmountReceived, @JsonKey(name: 'cod_amount', includeIfNull: false)  double? codAmount,  double? lat,  double? lng, @JsonKey(name: 'client_timestamp')  String? clientTimestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitPodRequest() when $default != null:
return $default(_that.photoUrl,_that.signatureUrl,_that.otpVerified,_that.receivedByName,_that.receivedByRelation,_that.deliveryNotes,_that.codCollected,_that.codAmountReceived,_that.codAmount,_that.lat,_that.lng,_that.clientTimestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'signature_url')  String? signatureUrl, @JsonKey(name: 'otp_verified')  bool otpVerified, @JsonKey(name: 'received_by_name')  String receivedByName, @JsonKey(name: 'received_by_relation')  String receivedByRelation, @JsonKey(name: 'delivery_notes')  String? deliveryNotes, @JsonKey(name: 'cod_collected')  bool codCollected, @JsonKey(name: 'cod_amount_received', includeIfNull: false)  double? codAmountReceived, @JsonKey(name: 'cod_amount', includeIfNull: false)  double? codAmount,  double? lat,  double? lng, @JsonKey(name: 'client_timestamp')  String? clientTimestamp)  $default,) {final _that = this;
switch (_that) {
case _SubmitPodRequest():
return $default(_that.photoUrl,_that.signatureUrl,_that.otpVerified,_that.receivedByName,_that.receivedByRelation,_that.deliveryNotes,_that.codCollected,_that.codAmountReceived,_that.codAmount,_that.lat,_that.lng,_that.clientTimestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'signature_url')  String? signatureUrl, @JsonKey(name: 'otp_verified')  bool otpVerified, @JsonKey(name: 'received_by_name')  String receivedByName, @JsonKey(name: 'received_by_relation')  String receivedByRelation, @JsonKey(name: 'delivery_notes')  String? deliveryNotes, @JsonKey(name: 'cod_collected')  bool codCollected, @JsonKey(name: 'cod_amount_received', includeIfNull: false)  double? codAmountReceived, @JsonKey(name: 'cod_amount', includeIfNull: false)  double? codAmount,  double? lat,  double? lng, @JsonKey(name: 'client_timestamp')  String? clientTimestamp)?  $default,) {final _that = this;
switch (_that) {
case _SubmitPodRequest() when $default != null:
return $default(_that.photoUrl,_that.signatureUrl,_that.otpVerified,_that.receivedByName,_that.receivedByRelation,_that.deliveryNotes,_that.codCollected,_that.codAmountReceived,_that.codAmount,_that.lat,_that.lng,_that.clientTimestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitPodRequest implements SubmitPodRequest {
  const _SubmitPodRequest({@JsonKey(name: 'photo_url') this.photoUrl, @JsonKey(name: 'signature_url') this.signatureUrl, @JsonKey(name: 'otp_verified') this.otpVerified = false, @JsonKey(name: 'received_by_name') required this.receivedByName, @JsonKey(name: 'received_by_relation') required this.receivedByRelation, @JsonKey(name: 'delivery_notes') this.deliveryNotes, @JsonKey(name: 'cod_collected') this.codCollected = false, @JsonKey(name: 'cod_amount_received', includeIfNull: false) this.codAmountReceived, @JsonKey(name: 'cod_amount', includeIfNull: false) this.codAmount, this.lat, this.lng, @JsonKey(name: 'client_timestamp') this.clientTimestamp});
  factory _SubmitPodRequest.fromJson(Map<String, dynamic> json) => _$SubmitPodRequestFromJson(json);

@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override@JsonKey(name: 'signature_url') final  String? signatureUrl;
@override@JsonKey(name: 'otp_verified') final  bool otpVerified;
@override@JsonKey(name: 'received_by_name') final  String receivedByName;
@override@JsonKey(name: 'received_by_relation') final  String receivedByRelation;
@override@JsonKey(name: 'delivery_notes') final  String? deliveryNotes;
@override@JsonKey(name: 'cod_collected') final  bool codCollected;
// Expected by backend for COD proof submission.
@override@JsonKey(name: 'cod_amount_received', includeIfNull: false) final  double? codAmountReceived;
// Kept for backwards compatibility; backend may ignore this.
@override@JsonKey(name: 'cod_amount', includeIfNull: false) final  double? codAmount;
@override final  double? lat;
@override final  double? lng;
@override@JsonKey(name: 'client_timestamp') final  String? clientTimestamp;

/// Create a copy of SubmitPodRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitPodRequestCopyWith<_SubmitPodRequest> get copyWith => __$SubmitPodRequestCopyWithImpl<_SubmitPodRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitPodRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitPodRequest&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.signatureUrl, signatureUrl) || other.signatureUrl == signatureUrl)&&(identical(other.otpVerified, otpVerified) || other.otpVerified == otpVerified)&&(identical(other.receivedByName, receivedByName) || other.receivedByName == receivedByName)&&(identical(other.receivedByRelation, receivedByRelation) || other.receivedByRelation == receivedByRelation)&&(identical(other.deliveryNotes, deliveryNotes) || other.deliveryNotes == deliveryNotes)&&(identical(other.codCollected, codCollected) || other.codCollected == codCollected)&&(identical(other.codAmountReceived, codAmountReceived) || other.codAmountReceived == codAmountReceived)&&(identical(other.codAmount, codAmount) || other.codAmount == codAmount)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.clientTimestamp, clientTimestamp) || other.clientTimestamp == clientTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,photoUrl,signatureUrl,otpVerified,receivedByName,receivedByRelation,deliveryNotes,codCollected,codAmountReceived,codAmount,lat,lng,clientTimestamp);

@override
String toString() {
  return 'SubmitPodRequest(photoUrl: $photoUrl, signatureUrl: $signatureUrl, otpVerified: $otpVerified, receivedByName: $receivedByName, receivedByRelation: $receivedByRelation, deliveryNotes: $deliveryNotes, codCollected: $codCollected, codAmountReceived: $codAmountReceived, codAmount: $codAmount, lat: $lat, lng: $lng, clientTimestamp: $clientTimestamp)';
}


}

/// @nodoc
abstract mixin class _$SubmitPodRequestCopyWith<$Res> implements $SubmitPodRequestCopyWith<$Res> {
  factory _$SubmitPodRequestCopyWith(_SubmitPodRequest value, $Res Function(_SubmitPodRequest) _then) = __$SubmitPodRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'signature_url') String? signatureUrl,@JsonKey(name: 'otp_verified') bool otpVerified,@JsonKey(name: 'received_by_name') String receivedByName,@JsonKey(name: 'received_by_relation') String receivedByRelation,@JsonKey(name: 'delivery_notes') String? deliveryNotes,@JsonKey(name: 'cod_collected') bool codCollected,@JsonKey(name: 'cod_amount_received', includeIfNull: false) double? codAmountReceived,@JsonKey(name: 'cod_amount', includeIfNull: false) double? codAmount, double? lat, double? lng,@JsonKey(name: 'client_timestamp') String? clientTimestamp
});




}
/// @nodoc
class __$SubmitPodRequestCopyWithImpl<$Res>
    implements _$SubmitPodRequestCopyWith<$Res> {
  __$SubmitPodRequestCopyWithImpl(this._self, this._then);

  final _SubmitPodRequest _self;
  final $Res Function(_SubmitPodRequest) _then;

/// Create a copy of SubmitPodRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photoUrl = freezed,Object? signatureUrl = freezed,Object? otpVerified = null,Object? receivedByName = null,Object? receivedByRelation = null,Object? deliveryNotes = freezed,Object? codCollected = null,Object? codAmountReceived = freezed,Object? codAmount = freezed,Object? lat = freezed,Object? lng = freezed,Object? clientTimestamp = freezed,}) {
  return _then(_SubmitPodRequest(
photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,signatureUrl: freezed == signatureUrl ? _self.signatureUrl : signatureUrl // ignore: cast_nullable_to_non_nullable
as String?,otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,receivedByName: null == receivedByName ? _self.receivedByName : receivedByName // ignore: cast_nullable_to_non_nullable
as String,receivedByRelation: null == receivedByRelation ? _self.receivedByRelation : receivedByRelation // ignore: cast_nullable_to_non_nullable
as String,deliveryNotes: freezed == deliveryNotes ? _self.deliveryNotes : deliveryNotes // ignore: cast_nullable_to_non_nullable
as String?,codCollected: null == codCollected ? _self.codCollected : codCollected // ignore: cast_nullable_to_non_nullable
as bool,codAmountReceived: freezed == codAmountReceived ? _self.codAmountReceived : codAmountReceived // ignore: cast_nullable_to_non_nullable
as double?,codAmount: freezed == codAmount ? _self.codAmount : codAmount // ignore: cast_nullable_to_non_nullable
as double?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,clientTimestamp: freezed == clientTimestamp ? _self.clientTimestamp : clientTimestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SubmitPodResponse {

@JsonKey(name: 'parcel_id') String get parcelId;@JsonKey(name: 'tracking_number') String get trackingNumber;// Newer backend response fields
@JsonKey(name: 'otp_verified') bool get otpVerified;@JsonKey(name: 'has_photo') bool get hasPhoto;@JsonKey(name: 'has_signature') bool get hasSignature;@JsonKey(name: 'received_by_name') String? get receivedByName;@JsonKey(name: 'received_by_relation') String? get receivedByRelation;@JsonKey(name: 'submitted_at') String? get submittedAt;// Older/alternate backend fields (kept optional for compatibility)
 String? get status;@JsonKey(name: 'delivered_at') String? get deliveredAt;@JsonKey(name: 'proof_recorded') bool? get proofRecorded;
/// Create a copy of SubmitPodResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitPodResponseCopyWith<SubmitPodResponse> get copyWith => _$SubmitPodResponseCopyWithImpl<SubmitPodResponse>(this as SubmitPodResponse, _$identity);

  /// Serializes this SubmitPodResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitPodResponse&&(identical(other.parcelId, parcelId) || other.parcelId == parcelId)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.otpVerified, otpVerified) || other.otpVerified == otpVerified)&&(identical(other.hasPhoto, hasPhoto) || other.hasPhoto == hasPhoto)&&(identical(other.hasSignature, hasSignature) || other.hasSignature == hasSignature)&&(identical(other.receivedByName, receivedByName) || other.receivedByName == receivedByName)&&(identical(other.receivedByRelation, receivedByRelation) || other.receivedByRelation == receivedByRelation)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.proofRecorded, proofRecorded) || other.proofRecorded == proofRecorded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parcelId,trackingNumber,otpVerified,hasPhoto,hasSignature,receivedByName,receivedByRelation,submittedAt,status,deliveredAt,proofRecorded);

@override
String toString() {
  return 'SubmitPodResponse(parcelId: $parcelId, trackingNumber: $trackingNumber, otpVerified: $otpVerified, hasPhoto: $hasPhoto, hasSignature: $hasSignature, receivedByName: $receivedByName, receivedByRelation: $receivedByRelation, submittedAt: $submittedAt, status: $status, deliveredAt: $deliveredAt, proofRecorded: $proofRecorded)';
}


}

/// @nodoc
abstract mixin class $SubmitPodResponseCopyWith<$Res>  {
  factory $SubmitPodResponseCopyWith(SubmitPodResponse value, $Res Function(SubmitPodResponse) _then) = _$SubmitPodResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'parcel_id') String parcelId,@JsonKey(name: 'tracking_number') String trackingNumber,@JsonKey(name: 'otp_verified') bool otpVerified,@JsonKey(name: 'has_photo') bool hasPhoto,@JsonKey(name: 'has_signature') bool hasSignature,@JsonKey(name: 'received_by_name') String? receivedByName,@JsonKey(name: 'received_by_relation') String? receivedByRelation,@JsonKey(name: 'submitted_at') String? submittedAt, String? status,@JsonKey(name: 'delivered_at') String? deliveredAt,@JsonKey(name: 'proof_recorded') bool? proofRecorded
});




}
/// @nodoc
class _$SubmitPodResponseCopyWithImpl<$Res>
    implements $SubmitPodResponseCopyWith<$Res> {
  _$SubmitPodResponseCopyWithImpl(this._self, this._then);

  final SubmitPodResponse _self;
  final $Res Function(SubmitPodResponse) _then;

/// Create a copy of SubmitPodResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parcelId = null,Object? trackingNumber = null,Object? otpVerified = null,Object? hasPhoto = null,Object? hasSignature = null,Object? receivedByName = freezed,Object? receivedByRelation = freezed,Object? submittedAt = freezed,Object? status = freezed,Object? deliveredAt = freezed,Object? proofRecorded = freezed,}) {
  return _then(_self.copyWith(
parcelId: null == parcelId ? _self.parcelId : parcelId // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: null == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String,otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,hasPhoto: null == hasPhoto ? _self.hasPhoto : hasPhoto // ignore: cast_nullable_to_non_nullable
as bool,hasSignature: null == hasSignature ? _self.hasSignature : hasSignature // ignore: cast_nullable_to_non_nullable
as bool,receivedByName: freezed == receivedByName ? _self.receivedByName : receivedByName // ignore: cast_nullable_to_non_nullable
as String?,receivedByRelation: freezed == receivedByRelation ? _self.receivedByRelation : receivedByRelation // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as String?,proofRecorded: freezed == proofRecorded ? _self.proofRecorded : proofRecorded // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitPodResponse].
extension SubmitPodResponsePatterns on SubmitPodResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitPodResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitPodResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitPodResponse value)  $default,){
final _that = this;
switch (_that) {
case _SubmitPodResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitPodResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitPodResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'otp_verified')  bool otpVerified, @JsonKey(name: 'has_photo')  bool hasPhoto, @JsonKey(name: 'has_signature')  bool hasSignature, @JsonKey(name: 'received_by_name')  String? receivedByName, @JsonKey(name: 'received_by_relation')  String? receivedByRelation, @JsonKey(name: 'submitted_at')  String? submittedAt,  String? status, @JsonKey(name: 'delivered_at')  String? deliveredAt, @JsonKey(name: 'proof_recorded')  bool? proofRecorded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitPodResponse() when $default != null:
return $default(_that.parcelId,_that.trackingNumber,_that.otpVerified,_that.hasPhoto,_that.hasSignature,_that.receivedByName,_that.receivedByRelation,_that.submittedAt,_that.status,_that.deliveredAt,_that.proofRecorded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'otp_verified')  bool otpVerified, @JsonKey(name: 'has_photo')  bool hasPhoto, @JsonKey(name: 'has_signature')  bool hasSignature, @JsonKey(name: 'received_by_name')  String? receivedByName, @JsonKey(name: 'received_by_relation')  String? receivedByRelation, @JsonKey(name: 'submitted_at')  String? submittedAt,  String? status, @JsonKey(name: 'delivered_at')  String? deliveredAt, @JsonKey(name: 'proof_recorded')  bool? proofRecorded)  $default,) {final _that = this;
switch (_that) {
case _SubmitPodResponse():
return $default(_that.parcelId,_that.trackingNumber,_that.otpVerified,_that.hasPhoto,_that.hasSignature,_that.receivedByName,_that.receivedByRelation,_that.submittedAt,_that.status,_that.deliveredAt,_that.proofRecorded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'otp_verified')  bool otpVerified, @JsonKey(name: 'has_photo')  bool hasPhoto, @JsonKey(name: 'has_signature')  bool hasSignature, @JsonKey(name: 'received_by_name')  String? receivedByName, @JsonKey(name: 'received_by_relation')  String? receivedByRelation, @JsonKey(name: 'submitted_at')  String? submittedAt,  String? status, @JsonKey(name: 'delivered_at')  String? deliveredAt, @JsonKey(name: 'proof_recorded')  bool? proofRecorded)?  $default,) {final _that = this;
switch (_that) {
case _SubmitPodResponse() when $default != null:
return $default(_that.parcelId,_that.trackingNumber,_that.otpVerified,_that.hasPhoto,_that.hasSignature,_that.receivedByName,_that.receivedByRelation,_that.submittedAt,_that.status,_that.deliveredAt,_that.proofRecorded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitPodResponse implements SubmitPodResponse {
  const _SubmitPodResponse({@JsonKey(name: 'parcel_id') required this.parcelId, @JsonKey(name: 'tracking_number') required this.trackingNumber, @JsonKey(name: 'otp_verified') this.otpVerified = false, @JsonKey(name: 'has_photo') this.hasPhoto = false, @JsonKey(name: 'has_signature') this.hasSignature = false, @JsonKey(name: 'received_by_name') this.receivedByName, @JsonKey(name: 'received_by_relation') this.receivedByRelation, @JsonKey(name: 'submitted_at') this.submittedAt, this.status, @JsonKey(name: 'delivered_at') this.deliveredAt, @JsonKey(name: 'proof_recorded') this.proofRecorded});
  factory _SubmitPodResponse.fromJson(Map<String, dynamic> json) => _$SubmitPodResponseFromJson(json);

@override@JsonKey(name: 'parcel_id') final  String parcelId;
@override@JsonKey(name: 'tracking_number') final  String trackingNumber;
// Newer backend response fields
@override@JsonKey(name: 'otp_verified') final  bool otpVerified;
@override@JsonKey(name: 'has_photo') final  bool hasPhoto;
@override@JsonKey(name: 'has_signature') final  bool hasSignature;
@override@JsonKey(name: 'received_by_name') final  String? receivedByName;
@override@JsonKey(name: 'received_by_relation') final  String? receivedByRelation;
@override@JsonKey(name: 'submitted_at') final  String? submittedAt;
// Older/alternate backend fields (kept optional for compatibility)
@override final  String? status;
@override@JsonKey(name: 'delivered_at') final  String? deliveredAt;
@override@JsonKey(name: 'proof_recorded') final  bool? proofRecorded;

/// Create a copy of SubmitPodResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitPodResponseCopyWith<_SubmitPodResponse> get copyWith => __$SubmitPodResponseCopyWithImpl<_SubmitPodResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitPodResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitPodResponse&&(identical(other.parcelId, parcelId) || other.parcelId == parcelId)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.otpVerified, otpVerified) || other.otpVerified == otpVerified)&&(identical(other.hasPhoto, hasPhoto) || other.hasPhoto == hasPhoto)&&(identical(other.hasSignature, hasSignature) || other.hasSignature == hasSignature)&&(identical(other.receivedByName, receivedByName) || other.receivedByName == receivedByName)&&(identical(other.receivedByRelation, receivedByRelation) || other.receivedByRelation == receivedByRelation)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.proofRecorded, proofRecorded) || other.proofRecorded == proofRecorded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parcelId,trackingNumber,otpVerified,hasPhoto,hasSignature,receivedByName,receivedByRelation,submittedAt,status,deliveredAt,proofRecorded);

@override
String toString() {
  return 'SubmitPodResponse(parcelId: $parcelId, trackingNumber: $trackingNumber, otpVerified: $otpVerified, hasPhoto: $hasPhoto, hasSignature: $hasSignature, receivedByName: $receivedByName, receivedByRelation: $receivedByRelation, submittedAt: $submittedAt, status: $status, deliveredAt: $deliveredAt, proofRecorded: $proofRecorded)';
}


}

/// @nodoc
abstract mixin class _$SubmitPodResponseCopyWith<$Res> implements $SubmitPodResponseCopyWith<$Res> {
  factory _$SubmitPodResponseCopyWith(_SubmitPodResponse value, $Res Function(_SubmitPodResponse) _then) = __$SubmitPodResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'parcel_id') String parcelId,@JsonKey(name: 'tracking_number') String trackingNumber,@JsonKey(name: 'otp_verified') bool otpVerified,@JsonKey(name: 'has_photo') bool hasPhoto,@JsonKey(name: 'has_signature') bool hasSignature,@JsonKey(name: 'received_by_name') String? receivedByName,@JsonKey(name: 'received_by_relation') String? receivedByRelation,@JsonKey(name: 'submitted_at') String? submittedAt, String? status,@JsonKey(name: 'delivered_at') String? deliveredAt,@JsonKey(name: 'proof_recorded') bool? proofRecorded
});




}
/// @nodoc
class __$SubmitPodResponseCopyWithImpl<$Res>
    implements _$SubmitPodResponseCopyWith<$Res> {
  __$SubmitPodResponseCopyWithImpl(this._self, this._then);

  final _SubmitPodResponse _self;
  final $Res Function(_SubmitPodResponse) _then;

/// Create a copy of SubmitPodResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parcelId = null,Object? trackingNumber = null,Object? otpVerified = null,Object? hasPhoto = null,Object? hasSignature = null,Object? receivedByName = freezed,Object? receivedByRelation = freezed,Object? submittedAt = freezed,Object? status = freezed,Object? deliveredAt = freezed,Object? proofRecorded = freezed,}) {
  return _then(_SubmitPodResponse(
parcelId: null == parcelId ? _self.parcelId : parcelId // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: null == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String,otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,hasPhoto: null == hasPhoto ? _self.hasPhoto : hasPhoto // ignore: cast_nullable_to_non_nullable
as bool,hasSignature: null == hasSignature ? _self.hasSignature : hasSignature // ignore: cast_nullable_to_non_nullable
as bool,receivedByName: freezed == receivedByName ? _self.receivedByName : receivedByName // ignore: cast_nullable_to_non_nullable
as String?,receivedByRelation: freezed == receivedByRelation ? _self.receivedByRelation : receivedByRelation // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as String?,proofRecorded: freezed == proofRecorded ? _self.proofRecorded : proofRecorded // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$UploadResponse {

/// For photo upload - the URL to access the photo
@JsonKey(name: 'photo_url') String? get photoUrl;/// For photo upload - the file path
@JsonKey(name: 'photo_path') String? get photoPath;/// For signature upload - the file path
@JsonKey(name: 'signature_path') String? get signaturePath;/// Success indicator
 bool get success;
/// Create a copy of UploadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadResponseCopyWith<UploadResponse> get copyWith => _$UploadResponseCopyWithImpl<UploadResponse>(this as UploadResponse, _$identity);

  /// Serializes this UploadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadResponse&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.signaturePath, signaturePath) || other.signaturePath == signaturePath)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,photoUrl,photoPath,signaturePath,success);

@override
String toString() {
  return 'UploadResponse(photoUrl: $photoUrl, photoPath: $photoPath, signaturePath: $signaturePath, success: $success)';
}


}

/// @nodoc
abstract mixin class $UploadResponseCopyWith<$Res>  {
  factory $UploadResponseCopyWith(UploadResponse value, $Res Function(UploadResponse) _then) = _$UploadResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'photo_path') String? photoPath,@JsonKey(name: 'signature_path') String? signaturePath, bool success
});




}
/// @nodoc
class _$UploadResponseCopyWithImpl<$Res>
    implements $UploadResponseCopyWith<$Res> {
  _$UploadResponseCopyWithImpl(this._self, this._then);

  final UploadResponse _self;
  final $Res Function(UploadResponse) _then;

/// Create a copy of UploadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photoUrl = freezed,Object? photoPath = freezed,Object? signaturePath = freezed,Object? success = null,}) {
  return _then(_self.copyWith(
photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,signaturePath: freezed == signaturePath ? _self.signaturePath : signaturePath // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadResponse].
extension UploadResponsePatterns on UploadResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadResponse value)  $default,){
final _that = this;
switch (_that) {
case _UploadResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UploadResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'photo_path')  String? photoPath, @JsonKey(name: 'signature_path')  String? signaturePath,  bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadResponse() when $default != null:
return $default(_that.photoUrl,_that.photoPath,_that.signaturePath,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'photo_path')  String? photoPath, @JsonKey(name: 'signature_path')  String? signaturePath,  bool success)  $default,) {final _that = this;
switch (_that) {
case _UploadResponse():
return $default(_that.photoUrl,_that.photoPath,_that.signaturePath,_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'photo_path')  String? photoPath, @JsonKey(name: 'signature_path')  String? signaturePath,  bool success)?  $default,) {final _that = this;
switch (_that) {
case _UploadResponse() when $default != null:
return $default(_that.photoUrl,_that.photoPath,_that.signaturePath,_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadResponse extends UploadResponse {
  const _UploadResponse({@JsonKey(name: 'photo_url') this.photoUrl, @JsonKey(name: 'photo_path') this.photoPath, @JsonKey(name: 'signature_path') this.signaturePath, this.success = false}): super._();
  factory _UploadResponse.fromJson(Map<String, dynamic> json) => _$UploadResponseFromJson(json);

/// For photo upload - the URL to access the photo
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
/// For photo upload - the file path
@override@JsonKey(name: 'photo_path') final  String? photoPath;
/// For signature upload - the file path
@override@JsonKey(name: 'signature_path') final  String? signaturePath;
/// Success indicator
@override@JsonKey() final  bool success;

/// Create a copy of UploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResponseCopyWith<_UploadResponse> get copyWith => __$UploadResponseCopyWithImpl<_UploadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResponse&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.signaturePath, signaturePath) || other.signaturePath == signaturePath)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,photoUrl,photoPath,signaturePath,success);

@override
String toString() {
  return 'UploadResponse(photoUrl: $photoUrl, photoPath: $photoPath, signaturePath: $signaturePath, success: $success)';
}


}

/// @nodoc
abstract mixin class _$UploadResponseCopyWith<$Res> implements $UploadResponseCopyWith<$Res> {
  factory _$UploadResponseCopyWith(_UploadResponse value, $Res Function(_UploadResponse) _then) = __$UploadResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'photo_path') String? photoPath,@JsonKey(name: 'signature_path') String? signaturePath, bool success
});




}
/// @nodoc
class __$UploadResponseCopyWithImpl<$Res>
    implements _$UploadResponseCopyWith<$Res> {
  __$UploadResponseCopyWithImpl(this._self, this._then);

  final _UploadResponse _self;
  final $Res Function(_UploadResponse) _then;

/// Create a copy of UploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photoUrl = freezed,Object? photoPath = freezed,Object? signaturePath = freezed,Object? success = null,}) {
  return _then(_UploadResponse(
photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,signaturePath: freezed == signaturePath ? _self.signaturePath : signaturePath // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
