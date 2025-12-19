// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatusUpdateRequest {

@JsonKey(name: 'new_status') String get newStatus; double? get lat; double? get lng;@JsonKey(name: 'failure_reason') String? get failureReason;@JsonKey(name: 'failure_notes') String? get failureNotes;@JsonKey(name: 'client_timestamp') String? get clientTimestamp;@JsonKey(name: 'client_update_id') String? get clientUpdateId;
/// Create a copy of StatusUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusUpdateRequestCopyWith<StatusUpdateRequest> get copyWith => _$StatusUpdateRequestCopyWithImpl<StatusUpdateRequest>(this as StatusUpdateRequest, _$identity);

  /// Serializes this StatusUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusUpdateRequest&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.failureNotes, failureNotes) || other.failureNotes == failureNotes)&&(identical(other.clientTimestamp, clientTimestamp) || other.clientTimestamp == clientTimestamp)&&(identical(other.clientUpdateId, clientUpdateId) || other.clientUpdateId == clientUpdateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newStatus,lat,lng,failureReason,failureNotes,clientTimestamp,clientUpdateId);

@override
String toString() {
  return 'StatusUpdateRequest(newStatus: $newStatus, lat: $lat, lng: $lng, failureReason: $failureReason, failureNotes: $failureNotes, clientTimestamp: $clientTimestamp, clientUpdateId: $clientUpdateId)';
}


}

/// @nodoc
abstract mixin class $StatusUpdateRequestCopyWith<$Res>  {
  factory $StatusUpdateRequestCopyWith(StatusUpdateRequest value, $Res Function(StatusUpdateRequest) _then) = _$StatusUpdateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'new_status') String newStatus, double? lat, double? lng,@JsonKey(name: 'failure_reason') String? failureReason,@JsonKey(name: 'failure_notes') String? failureNotes,@JsonKey(name: 'client_timestamp') String? clientTimestamp,@JsonKey(name: 'client_update_id') String? clientUpdateId
});




}
/// @nodoc
class _$StatusUpdateRequestCopyWithImpl<$Res>
    implements $StatusUpdateRequestCopyWith<$Res> {
  _$StatusUpdateRequestCopyWithImpl(this._self, this._then);

  final StatusUpdateRequest _self;
  final $Res Function(StatusUpdateRequest) _then;

/// Create a copy of StatusUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newStatus = null,Object? lat = freezed,Object? lng = freezed,Object? failureReason = freezed,Object? failureNotes = freezed,Object? clientTimestamp = freezed,Object? clientUpdateId = freezed,}) {
  return _then(_self.copyWith(
newStatus: null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as String,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,failureNotes: freezed == failureNotes ? _self.failureNotes : failureNotes // ignore: cast_nullable_to_non_nullable
as String?,clientTimestamp: freezed == clientTimestamp ? _self.clientTimestamp : clientTimestamp // ignore: cast_nullable_to_non_nullable
as String?,clientUpdateId: freezed == clientUpdateId ? _self.clientUpdateId : clientUpdateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusUpdateRequest].
extension StatusUpdateRequestPatterns on StatusUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _StatusUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _StatusUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'new_status')  String newStatus,  double? lat,  double? lng, @JsonKey(name: 'failure_reason')  String? failureReason, @JsonKey(name: 'failure_notes')  String? failureNotes, @JsonKey(name: 'client_timestamp')  String? clientTimestamp, @JsonKey(name: 'client_update_id')  String? clientUpdateId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusUpdateRequest() when $default != null:
return $default(_that.newStatus,_that.lat,_that.lng,_that.failureReason,_that.failureNotes,_that.clientTimestamp,_that.clientUpdateId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'new_status')  String newStatus,  double? lat,  double? lng, @JsonKey(name: 'failure_reason')  String? failureReason, @JsonKey(name: 'failure_notes')  String? failureNotes, @JsonKey(name: 'client_timestamp')  String? clientTimestamp, @JsonKey(name: 'client_update_id')  String? clientUpdateId)  $default,) {final _that = this;
switch (_that) {
case _StatusUpdateRequest():
return $default(_that.newStatus,_that.lat,_that.lng,_that.failureReason,_that.failureNotes,_that.clientTimestamp,_that.clientUpdateId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'new_status')  String newStatus,  double? lat,  double? lng, @JsonKey(name: 'failure_reason')  String? failureReason, @JsonKey(name: 'failure_notes')  String? failureNotes, @JsonKey(name: 'client_timestamp')  String? clientTimestamp, @JsonKey(name: 'client_update_id')  String? clientUpdateId)?  $default,) {final _that = this;
switch (_that) {
case _StatusUpdateRequest() when $default != null:
return $default(_that.newStatus,_that.lat,_that.lng,_that.failureReason,_that.failureNotes,_that.clientTimestamp,_that.clientUpdateId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusUpdateRequest implements StatusUpdateRequest {
  const _StatusUpdateRequest({@JsonKey(name: 'new_status') required this.newStatus, this.lat, this.lng, @JsonKey(name: 'failure_reason') this.failureReason, @JsonKey(name: 'failure_notes') this.failureNotes, @JsonKey(name: 'client_timestamp') this.clientTimestamp, @JsonKey(name: 'client_update_id') this.clientUpdateId});
  factory _StatusUpdateRequest.fromJson(Map<String, dynamic> json) => _$StatusUpdateRequestFromJson(json);

@override@JsonKey(name: 'new_status') final  String newStatus;
@override final  double? lat;
@override final  double? lng;
@override@JsonKey(name: 'failure_reason') final  String? failureReason;
@override@JsonKey(name: 'failure_notes') final  String? failureNotes;
@override@JsonKey(name: 'client_timestamp') final  String? clientTimestamp;
@override@JsonKey(name: 'client_update_id') final  String? clientUpdateId;

/// Create a copy of StatusUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusUpdateRequestCopyWith<_StatusUpdateRequest> get copyWith => __$StatusUpdateRequestCopyWithImpl<_StatusUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusUpdateRequest&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.failureNotes, failureNotes) || other.failureNotes == failureNotes)&&(identical(other.clientTimestamp, clientTimestamp) || other.clientTimestamp == clientTimestamp)&&(identical(other.clientUpdateId, clientUpdateId) || other.clientUpdateId == clientUpdateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newStatus,lat,lng,failureReason,failureNotes,clientTimestamp,clientUpdateId);

@override
String toString() {
  return 'StatusUpdateRequest(newStatus: $newStatus, lat: $lat, lng: $lng, failureReason: $failureReason, failureNotes: $failureNotes, clientTimestamp: $clientTimestamp, clientUpdateId: $clientUpdateId)';
}


}

/// @nodoc
abstract mixin class _$StatusUpdateRequestCopyWith<$Res> implements $StatusUpdateRequestCopyWith<$Res> {
  factory _$StatusUpdateRequestCopyWith(_StatusUpdateRequest value, $Res Function(_StatusUpdateRequest) _then) = __$StatusUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'new_status') String newStatus, double? lat, double? lng,@JsonKey(name: 'failure_reason') String? failureReason,@JsonKey(name: 'failure_notes') String? failureNotes,@JsonKey(name: 'client_timestamp') String? clientTimestamp,@JsonKey(name: 'client_update_id') String? clientUpdateId
});




}
/// @nodoc
class __$StatusUpdateRequestCopyWithImpl<$Res>
    implements _$StatusUpdateRequestCopyWith<$Res> {
  __$StatusUpdateRequestCopyWithImpl(this._self, this._then);

  final _StatusUpdateRequest _self;
  final $Res Function(_StatusUpdateRequest) _then;

/// Create a copy of StatusUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newStatus = null,Object? lat = freezed,Object? lng = freezed,Object? failureReason = freezed,Object? failureNotes = freezed,Object? clientTimestamp = freezed,Object? clientUpdateId = freezed,}) {
  return _then(_StatusUpdateRequest(
newStatus: null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as String,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,failureNotes: freezed == failureNotes ? _self.failureNotes : failureNotes // ignore: cast_nullable_to_non_nullable
as String?,clientTimestamp: freezed == clientTimestamp ? _self.clientTimestamp : clientTimestamp // ignore: cast_nullable_to_non_nullable
as String?,clientUpdateId: freezed == clientUpdateId ? _self.clientUpdateId : clientUpdateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StatusUpdateResponse {

@JsonKey(name: 'parcel_id') String get parcelId;@JsonKey(name: 'tracking_number') String get trackingNumber;@JsonKey(name: 'previous_status') String get previousStatus;@JsonKey(name: 'new_status') String get newStatus;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'is_duplicate') bool get isDuplicate;
/// Create a copy of StatusUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusUpdateResponseCopyWith<StatusUpdateResponse> get copyWith => _$StatusUpdateResponseCopyWithImpl<StatusUpdateResponse>(this as StatusUpdateResponse, _$identity);

  /// Serializes this StatusUpdateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusUpdateResponse&&(identical(other.parcelId, parcelId) || other.parcelId == parcelId)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.previousStatus, previousStatus) || other.previousStatus == previousStatus)&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDuplicate, isDuplicate) || other.isDuplicate == isDuplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parcelId,trackingNumber,previousStatus,newStatus,updatedAt,isDuplicate);

@override
String toString() {
  return 'StatusUpdateResponse(parcelId: $parcelId, trackingNumber: $trackingNumber, previousStatus: $previousStatus, newStatus: $newStatus, updatedAt: $updatedAt, isDuplicate: $isDuplicate)';
}


}

/// @nodoc
abstract mixin class $StatusUpdateResponseCopyWith<$Res>  {
  factory $StatusUpdateResponseCopyWith(StatusUpdateResponse value, $Res Function(StatusUpdateResponse) _then) = _$StatusUpdateResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'parcel_id') String parcelId,@JsonKey(name: 'tracking_number') String trackingNumber,@JsonKey(name: 'previous_status') String previousStatus,@JsonKey(name: 'new_status') String newStatus,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'is_duplicate') bool isDuplicate
});




}
/// @nodoc
class _$StatusUpdateResponseCopyWithImpl<$Res>
    implements $StatusUpdateResponseCopyWith<$Res> {
  _$StatusUpdateResponseCopyWithImpl(this._self, this._then);

  final StatusUpdateResponse _self;
  final $Res Function(StatusUpdateResponse) _then;

/// Create a copy of StatusUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parcelId = null,Object? trackingNumber = null,Object? previousStatus = null,Object? newStatus = null,Object? updatedAt = null,Object? isDuplicate = null,}) {
  return _then(_self.copyWith(
parcelId: null == parcelId ? _self.parcelId : parcelId // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: null == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String,previousStatus: null == previousStatus ? _self.previousStatus : previousStatus // ignore: cast_nullable_to_non_nullable
as String,newStatus: null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isDuplicate: null == isDuplicate ? _self.isDuplicate : isDuplicate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusUpdateResponse].
extension StatusUpdateResponsePatterns on StatusUpdateResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusUpdateResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusUpdateResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusUpdateResponse value)  $default,){
final _that = this;
switch (_that) {
case _StatusUpdateResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusUpdateResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StatusUpdateResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'previous_status')  String previousStatus, @JsonKey(name: 'new_status')  String newStatus, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_duplicate')  bool isDuplicate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusUpdateResponse() when $default != null:
return $default(_that.parcelId,_that.trackingNumber,_that.previousStatus,_that.newStatus,_that.updatedAt,_that.isDuplicate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'previous_status')  String previousStatus, @JsonKey(name: 'new_status')  String newStatus, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_duplicate')  bool isDuplicate)  $default,) {final _that = this;
switch (_that) {
case _StatusUpdateResponse():
return $default(_that.parcelId,_that.trackingNumber,_that.previousStatus,_that.newStatus,_that.updatedAt,_that.isDuplicate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'parcel_id')  String parcelId, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'previous_status')  String previousStatus, @JsonKey(name: 'new_status')  String newStatus, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'is_duplicate')  bool isDuplicate)?  $default,) {final _that = this;
switch (_that) {
case _StatusUpdateResponse() when $default != null:
return $default(_that.parcelId,_that.trackingNumber,_that.previousStatus,_that.newStatus,_that.updatedAt,_that.isDuplicate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusUpdateResponse implements StatusUpdateResponse {
  const _StatusUpdateResponse({@JsonKey(name: 'parcel_id') required this.parcelId, @JsonKey(name: 'tracking_number') required this.trackingNumber, @JsonKey(name: 'previous_status') required this.previousStatus, @JsonKey(name: 'new_status') required this.newStatus, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'is_duplicate') this.isDuplicate = false});
  factory _StatusUpdateResponse.fromJson(Map<String, dynamic> json) => _$StatusUpdateResponseFromJson(json);

@override@JsonKey(name: 'parcel_id') final  String parcelId;
@override@JsonKey(name: 'tracking_number') final  String trackingNumber;
@override@JsonKey(name: 'previous_status') final  String previousStatus;
@override@JsonKey(name: 'new_status') final  String newStatus;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'is_duplicate') final  bool isDuplicate;

/// Create a copy of StatusUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusUpdateResponseCopyWith<_StatusUpdateResponse> get copyWith => __$StatusUpdateResponseCopyWithImpl<_StatusUpdateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusUpdateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusUpdateResponse&&(identical(other.parcelId, parcelId) || other.parcelId == parcelId)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.previousStatus, previousStatus) || other.previousStatus == previousStatus)&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDuplicate, isDuplicate) || other.isDuplicate == isDuplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parcelId,trackingNumber,previousStatus,newStatus,updatedAt,isDuplicate);

@override
String toString() {
  return 'StatusUpdateResponse(parcelId: $parcelId, trackingNumber: $trackingNumber, previousStatus: $previousStatus, newStatus: $newStatus, updatedAt: $updatedAt, isDuplicate: $isDuplicate)';
}


}

/// @nodoc
abstract mixin class _$StatusUpdateResponseCopyWith<$Res> implements $StatusUpdateResponseCopyWith<$Res> {
  factory _$StatusUpdateResponseCopyWith(_StatusUpdateResponse value, $Res Function(_StatusUpdateResponse) _then) = __$StatusUpdateResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'parcel_id') String parcelId,@JsonKey(name: 'tracking_number') String trackingNumber,@JsonKey(name: 'previous_status') String previousStatus,@JsonKey(name: 'new_status') String newStatus,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'is_duplicate') bool isDuplicate
});




}
/// @nodoc
class __$StatusUpdateResponseCopyWithImpl<$Res>
    implements _$StatusUpdateResponseCopyWith<$Res> {
  __$StatusUpdateResponseCopyWithImpl(this._self, this._then);

  final _StatusUpdateResponse _self;
  final $Res Function(_StatusUpdateResponse) _then;

/// Create a copy of StatusUpdateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parcelId = null,Object? trackingNumber = null,Object? previousStatus = null,Object? newStatus = null,Object? updatedAt = null,Object? isDuplicate = null,}) {
  return _then(_StatusUpdateResponse(
parcelId: null == parcelId ? _self.parcelId : parcelId // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: null == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String,previousStatus: null == previousStatus ? _self.previousStatus : previousStatus // ignore: cast_nullable_to_non_nullable
as String,newStatus: null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isDuplicate: null == isDuplicate ? _self.isDuplicate : isDuplicate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
