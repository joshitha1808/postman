// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationUpdate {

 double get latitude; double get longitude; double? get accuracy; double? get altitude; double? get speed; double? get heading; String get timestamp;@JsonKey(name: 'battery_level') int? get batteryLevel;
/// Create a copy of LocationUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationUpdateCopyWith<LocationUpdate> get copyWith => _$LocationUpdateCopyWithImpl<LocationUpdate>(this as LocationUpdate, _$identity);

  /// Serializes this LocationUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationUpdate&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,accuracy,altitude,speed,heading,timestamp,batteryLevel);

@override
String toString() {
  return 'LocationUpdate(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, speed: $speed, heading: $heading, timestamp: $timestamp, batteryLevel: $batteryLevel)';
}


}

/// @nodoc
abstract mixin class $LocationUpdateCopyWith<$Res>  {
  factory $LocationUpdateCopyWith(LocationUpdate value, $Res Function(LocationUpdate) _then) = _$LocationUpdateCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, double? accuracy, double? altitude, double? speed, double? heading, String timestamp,@JsonKey(name: 'battery_level') int? batteryLevel
});




}
/// @nodoc
class _$LocationUpdateCopyWithImpl<$Res>
    implements $LocationUpdateCopyWith<$Res> {
  _$LocationUpdateCopyWithImpl(this._self, this._then);

  final LocationUpdate _self;
  final $Res Function(LocationUpdate) _then;

/// Create a copy of LocationUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? accuracy = freezed,Object? altitude = freezed,Object? speed = freezed,Object? heading = freezed,Object? timestamp = null,Object? batteryLevel = freezed,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationUpdate].
extension LocationUpdatePatterns on LocationUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationUpdate value)  $default,){
final _that = this;
switch (_that) {
case _LocationUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _LocationUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading,  String timestamp, @JsonKey(name: 'battery_level')  int? batteryLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationUpdate() when $default != null:
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.altitude,_that.speed,_that.heading,_that.timestamp,_that.batteryLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading,  String timestamp, @JsonKey(name: 'battery_level')  int? batteryLevel)  $default,) {final _that = this;
switch (_that) {
case _LocationUpdate():
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.altitude,_that.speed,_that.heading,_that.timestamp,_that.batteryLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading,  String timestamp, @JsonKey(name: 'battery_level')  int? batteryLevel)?  $default,) {final _that = this;
switch (_that) {
case _LocationUpdate() when $default != null:
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.altitude,_that.speed,_that.heading,_that.timestamp,_that.batteryLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationUpdate implements LocationUpdate {
  const _LocationUpdate({required this.latitude, required this.longitude, this.accuracy, this.altitude, this.speed, this.heading, required this.timestamp, @JsonKey(name: 'battery_level') this.batteryLevel});
  factory _LocationUpdate.fromJson(Map<String, dynamic> json) => _$LocationUpdateFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  double? accuracy;
@override final  double? altitude;
@override final  double? speed;
@override final  double? heading;
@override final  String timestamp;
@override@JsonKey(name: 'battery_level') final  int? batteryLevel;

/// Create a copy of LocationUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationUpdateCopyWith<_LocationUpdate> get copyWith => __$LocationUpdateCopyWithImpl<_LocationUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationUpdate&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,accuracy,altitude,speed,heading,timestamp,batteryLevel);

@override
String toString() {
  return 'LocationUpdate(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, speed: $speed, heading: $heading, timestamp: $timestamp, batteryLevel: $batteryLevel)';
}


}

/// @nodoc
abstract mixin class _$LocationUpdateCopyWith<$Res> implements $LocationUpdateCopyWith<$Res> {
  factory _$LocationUpdateCopyWith(_LocationUpdate value, $Res Function(_LocationUpdate) _then) = __$LocationUpdateCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, double? accuracy, double? altitude, double? speed, double? heading, String timestamp,@JsonKey(name: 'battery_level') int? batteryLevel
});




}
/// @nodoc
class __$LocationUpdateCopyWithImpl<$Res>
    implements _$LocationUpdateCopyWith<$Res> {
  __$LocationUpdateCopyWithImpl(this._self, this._then);

  final _LocationUpdate _self;
  final $Res Function(_LocationUpdate) _then;

/// Create a copy of LocationUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? accuracy = freezed,Object? altitude = freezed,Object? speed = freezed,Object? heading = freezed,Object? timestamp = null,Object? batteryLevel = freezed,}) {
  return _then(_LocationUpdate(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LocationUpdateResponse {

 bool get success; String? get message;@JsonKey(name: 'last_updated') String? get lastUpdated;
/// Create a copy of LocationUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationUpdateResponseCopyWith<LocationUpdateResponse> get copyWith => _$LocationUpdateResponseCopyWithImpl<LocationUpdateResponse>(this as LocationUpdateResponse, _$identity);

  /// Serializes this LocationUpdateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationUpdateResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,lastUpdated);

@override
String toString() {
  return 'LocationUpdateResponse(success: $success, message: $message, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $LocationUpdateResponseCopyWith<$Res>  {
  factory $LocationUpdateResponseCopyWith(LocationUpdateResponse value, $Res Function(LocationUpdateResponse) _then) = _$LocationUpdateResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String? message,@JsonKey(name: 'last_updated') String? lastUpdated
});




}
/// @nodoc
class _$LocationUpdateResponseCopyWithImpl<$Res>
    implements $LocationUpdateResponseCopyWith<$Res> {
  _$LocationUpdateResponseCopyWithImpl(this._self, this._then);

  final LocationUpdateResponse _self;
  final $Res Function(LocationUpdateResponse) _then;

/// Create a copy of LocationUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationUpdateResponse].
extension LocationUpdateResponsePatterns on LocationUpdateResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationUpdateResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationUpdateResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationUpdateResponse value)  $default,){
final _that = this;
switch (_that) {
case _LocationUpdateResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationUpdateResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LocationUpdateResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String? message, @JsonKey(name: 'last_updated')  String? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationUpdateResponse() when $default != null:
return $default(_that.success,_that.message,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String? message, @JsonKey(name: 'last_updated')  String? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _LocationUpdateResponse():
return $default(_that.success,_that.message,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String? message, @JsonKey(name: 'last_updated')  String? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _LocationUpdateResponse() when $default != null:
return $default(_that.success,_that.message,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationUpdateResponse implements LocationUpdateResponse {
  const _LocationUpdateResponse({required this.success, this.message, @JsonKey(name: 'last_updated') this.lastUpdated});
  factory _LocationUpdateResponse.fromJson(Map<String, dynamic> json) => _$LocationUpdateResponseFromJson(json);

@override final  bool success;
@override final  String? message;
@override@JsonKey(name: 'last_updated') final  String? lastUpdated;

/// Create a copy of LocationUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationUpdateResponseCopyWith<_LocationUpdateResponse> get copyWith => __$LocationUpdateResponseCopyWithImpl<_LocationUpdateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationUpdateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationUpdateResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,lastUpdated);

@override
String toString() {
  return 'LocationUpdateResponse(success: $success, message: $message, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$LocationUpdateResponseCopyWith<$Res> implements $LocationUpdateResponseCopyWith<$Res> {
  factory _$LocationUpdateResponseCopyWith(_LocationUpdateResponse value, $Res Function(_LocationUpdateResponse) _then) = __$LocationUpdateResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String? message,@JsonKey(name: 'last_updated') String? lastUpdated
});




}
/// @nodoc
class __$LocationUpdateResponseCopyWithImpl<$Res>
    implements _$LocationUpdateResponseCopyWith<$Res> {
  __$LocationUpdateResponseCopyWithImpl(this._self, this._then);

  final _LocationUpdateResponse _self;
  final $Res Function(_LocationUpdateResponse) _then;

/// Create a copy of LocationUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = freezed,Object? lastUpdated = freezed,}) {
  return _then(_LocationUpdateResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CurrentLocationResponse {

@JsonKey(name: 'postman_id') String get postmanId; double get latitude; double get longitude;@JsonKey(name: 'last_updated') String get lastUpdated;@JsonKey(name: 'is_on_duty') bool get isOnDuty;
/// Create a copy of CurrentLocationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentLocationResponseCopyWith<CurrentLocationResponse> get copyWith => _$CurrentLocationResponseCopyWithImpl<CurrentLocationResponse>(this as CurrentLocationResponse, _$identity);

  /// Serializes this CurrentLocationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentLocationResponse&&(identical(other.postmanId, postmanId) || other.postmanId == postmanId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.isOnDuty, isOnDuty) || other.isOnDuty == isOnDuty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postmanId,latitude,longitude,lastUpdated,isOnDuty);

@override
String toString() {
  return 'CurrentLocationResponse(postmanId: $postmanId, latitude: $latitude, longitude: $longitude, lastUpdated: $lastUpdated, isOnDuty: $isOnDuty)';
}


}

/// @nodoc
abstract mixin class $CurrentLocationResponseCopyWith<$Res>  {
  factory $CurrentLocationResponseCopyWith(CurrentLocationResponse value, $Res Function(CurrentLocationResponse) _then) = _$CurrentLocationResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'postman_id') String postmanId, double latitude, double longitude,@JsonKey(name: 'last_updated') String lastUpdated,@JsonKey(name: 'is_on_duty') bool isOnDuty
});




}
/// @nodoc
class _$CurrentLocationResponseCopyWithImpl<$Res>
    implements $CurrentLocationResponseCopyWith<$Res> {
  _$CurrentLocationResponseCopyWithImpl(this._self, this._then);

  final CurrentLocationResponse _self;
  final $Res Function(CurrentLocationResponse) _then;

/// Create a copy of CurrentLocationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postmanId = null,Object? latitude = null,Object? longitude = null,Object? lastUpdated = null,Object? isOnDuty = null,}) {
  return _then(_self.copyWith(
postmanId: null == postmanId ? _self.postmanId : postmanId // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,isOnDuty: null == isOnDuty ? _self.isOnDuty : isOnDuty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentLocationResponse].
extension CurrentLocationResponsePatterns on CurrentLocationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentLocationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentLocationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentLocationResponse value)  $default,){
final _that = this;
switch (_that) {
case _CurrentLocationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentLocationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentLocationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'postman_id')  String postmanId,  double latitude,  double longitude, @JsonKey(name: 'last_updated')  String lastUpdated, @JsonKey(name: 'is_on_duty')  bool isOnDuty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentLocationResponse() when $default != null:
return $default(_that.postmanId,_that.latitude,_that.longitude,_that.lastUpdated,_that.isOnDuty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'postman_id')  String postmanId,  double latitude,  double longitude, @JsonKey(name: 'last_updated')  String lastUpdated, @JsonKey(name: 'is_on_duty')  bool isOnDuty)  $default,) {final _that = this;
switch (_that) {
case _CurrentLocationResponse():
return $default(_that.postmanId,_that.latitude,_that.longitude,_that.lastUpdated,_that.isOnDuty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'postman_id')  String postmanId,  double latitude,  double longitude, @JsonKey(name: 'last_updated')  String lastUpdated, @JsonKey(name: 'is_on_duty')  bool isOnDuty)?  $default,) {final _that = this;
switch (_that) {
case _CurrentLocationResponse() when $default != null:
return $default(_that.postmanId,_that.latitude,_that.longitude,_that.lastUpdated,_that.isOnDuty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentLocationResponse implements CurrentLocationResponse {
  const _CurrentLocationResponse({@JsonKey(name: 'postman_id') required this.postmanId, required this.latitude, required this.longitude, @JsonKey(name: 'last_updated') required this.lastUpdated, @JsonKey(name: 'is_on_duty') required this.isOnDuty});
  factory _CurrentLocationResponse.fromJson(Map<String, dynamic> json) => _$CurrentLocationResponseFromJson(json);

@override@JsonKey(name: 'postman_id') final  String postmanId;
@override final  double latitude;
@override final  double longitude;
@override@JsonKey(name: 'last_updated') final  String lastUpdated;
@override@JsonKey(name: 'is_on_duty') final  bool isOnDuty;

/// Create a copy of CurrentLocationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentLocationResponseCopyWith<_CurrentLocationResponse> get copyWith => __$CurrentLocationResponseCopyWithImpl<_CurrentLocationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentLocationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentLocationResponse&&(identical(other.postmanId, postmanId) || other.postmanId == postmanId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.isOnDuty, isOnDuty) || other.isOnDuty == isOnDuty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postmanId,latitude,longitude,lastUpdated,isOnDuty);

@override
String toString() {
  return 'CurrentLocationResponse(postmanId: $postmanId, latitude: $latitude, longitude: $longitude, lastUpdated: $lastUpdated, isOnDuty: $isOnDuty)';
}


}

/// @nodoc
abstract mixin class _$CurrentLocationResponseCopyWith<$Res> implements $CurrentLocationResponseCopyWith<$Res> {
  factory _$CurrentLocationResponseCopyWith(_CurrentLocationResponse value, $Res Function(_CurrentLocationResponse) _then) = __$CurrentLocationResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'postman_id') String postmanId, double latitude, double longitude,@JsonKey(name: 'last_updated') String lastUpdated,@JsonKey(name: 'is_on_duty') bool isOnDuty
});




}
/// @nodoc
class __$CurrentLocationResponseCopyWithImpl<$Res>
    implements _$CurrentLocationResponseCopyWith<$Res> {
  __$CurrentLocationResponseCopyWithImpl(this._self, this._then);

  final _CurrentLocationResponse _self;
  final $Res Function(_CurrentLocationResponse) _then;

/// Create a copy of CurrentLocationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postmanId = null,Object? latitude = null,Object? longitude = null,Object? lastUpdated = null,Object? isOnDuty = null,}) {
  return _then(_CurrentLocationResponse(
postmanId: null == postmanId ? _self.postmanId : postmanId // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,isOnDuty: null == isOnDuty ? _self.isOnDuty : isOnDuty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$LocationMessage {

 LocationMessageType get type; LocationUpdate? get data; String? get message;
/// Create a copy of LocationMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationMessageCopyWith<LocationMessage> get copyWith => _$LocationMessageCopyWithImpl<LocationMessage>(this as LocationMessage, _$identity);

  /// Serializes this LocationMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationMessage&&(identical(other.type, type) || other.type == type)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,data,message);

@override
String toString() {
  return 'LocationMessage(type: $type, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $LocationMessageCopyWith<$Res>  {
  factory $LocationMessageCopyWith(LocationMessage value, $Res Function(LocationMessage) _then) = _$LocationMessageCopyWithImpl;
@useResult
$Res call({
 LocationMessageType type, LocationUpdate? data, String? message
});


$LocationUpdateCopyWith<$Res>? get data;

}
/// @nodoc
class _$LocationMessageCopyWithImpl<$Res>
    implements $LocationMessageCopyWith<$Res> {
  _$LocationMessageCopyWithImpl(this._self, this._then);

  final LocationMessage _self;
  final $Res Function(LocationMessage) _then;

/// Create a copy of LocationMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? data = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LocationMessageType,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LocationUpdate?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LocationMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationUpdateCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LocationUpdateCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [LocationMessage].
extension LocationMessagePatterns on LocationMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationMessage value)  $default,){
final _that = this;
switch (_that) {
case _LocationMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationMessage value)?  $default,){
final _that = this;
switch (_that) {
case _LocationMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocationMessageType type,  LocationUpdate? data,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationMessage() when $default != null:
return $default(_that.type,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocationMessageType type,  LocationUpdate? data,  String? message)  $default,) {final _that = this;
switch (_that) {
case _LocationMessage():
return $default(_that.type,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocationMessageType type,  LocationUpdate? data,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _LocationMessage() when $default != null:
return $default(_that.type,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationMessage implements LocationMessage {
  const _LocationMessage({required this.type, this.data, this.message});
  factory _LocationMessage.fromJson(Map<String, dynamic> json) => _$LocationMessageFromJson(json);

@override final  LocationMessageType type;
@override final  LocationUpdate? data;
@override final  String? message;

/// Create a copy of LocationMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationMessageCopyWith<_LocationMessage> get copyWith => __$LocationMessageCopyWithImpl<_LocationMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationMessage&&(identical(other.type, type) || other.type == type)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,data,message);

@override
String toString() {
  return 'LocationMessage(type: $type, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LocationMessageCopyWith<$Res> implements $LocationMessageCopyWith<$Res> {
  factory _$LocationMessageCopyWith(_LocationMessage value, $Res Function(_LocationMessage) _then) = __$LocationMessageCopyWithImpl;
@override @useResult
$Res call({
 LocationMessageType type, LocationUpdate? data, String? message
});


@override $LocationUpdateCopyWith<$Res>? get data;

}
/// @nodoc
class __$LocationMessageCopyWithImpl<$Res>
    implements _$LocationMessageCopyWith<$Res> {
  __$LocationMessageCopyWithImpl(this._self, this._then);

  final _LocationMessage _self;
  final $Res Function(_LocationMessage) _then;

/// Create a copy of LocationMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? data = freezed,Object? message = freezed,}) {
  return _then(_LocationMessage(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LocationMessageType,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LocationUpdate?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LocationMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationUpdateCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LocationUpdateCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
