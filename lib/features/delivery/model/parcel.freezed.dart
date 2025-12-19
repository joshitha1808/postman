// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parcel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Parcel {

 String get id;@JsonKey(name: 'tracking_number') String get trackingNumber;@JsonKey(name: 'recipient_name') String get recipientName;@JsonKey(name: 'recipient_phone') String? get recipientPhone;@JsonKey(name: 'recipient_address') String get recipientAddress;@JsonKey(name: 'recipient_pincode') String get recipientPincode;@JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson) DeliveryStatus get status;@JsonKey(name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson) DeliveryPriority get priority;@JsonKey(name: 'delivery_sequence') int? get deliverySequence;@JsonKey(name: 'parcel_type') String? get parcelType;@JsonKey(name: 'is_cod') bool get isCod;@JsonKey(name: 'cod_amount') double get codAmount;@JsonKey(name: 'weight_grams') int get weightGrams;@JsonKey(name: 'has_customer_pin') bool get hasCustomerPin;@JsonKey(name: 'delivery_lat') double? get deliveryLat;@JsonKey(name: 'delivery_lng') double? get deliveryLng;
/// Create a copy of Parcel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParcelCopyWith<Parcel> get copyWith => _$ParcelCopyWithImpl<Parcel>(this as Parcel, _$identity);

  /// Serializes this Parcel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Parcel&&(identical(other.id, id) || other.id == id)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.recipientAddress, recipientAddress) || other.recipientAddress == recipientAddress)&&(identical(other.recipientPincode, recipientPincode) || other.recipientPincode == recipientPincode)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.deliverySequence, deliverySequence) || other.deliverySequence == deliverySequence)&&(identical(other.parcelType, parcelType) || other.parcelType == parcelType)&&(identical(other.isCod, isCod) || other.isCod == isCod)&&(identical(other.codAmount, codAmount) || other.codAmount == codAmount)&&(identical(other.weightGrams, weightGrams) || other.weightGrams == weightGrams)&&(identical(other.hasCustomerPin, hasCustomerPin) || other.hasCustomerPin == hasCustomerPin)&&(identical(other.deliveryLat, deliveryLat) || other.deliveryLat == deliveryLat)&&(identical(other.deliveryLng, deliveryLng) || other.deliveryLng == deliveryLng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trackingNumber,recipientName,recipientPhone,recipientAddress,recipientPincode,status,priority,deliverySequence,parcelType,isCod,codAmount,weightGrams,hasCustomerPin,deliveryLat,deliveryLng);

@override
String toString() {
  return 'Parcel(id: $id, trackingNumber: $trackingNumber, recipientName: $recipientName, recipientPhone: $recipientPhone, recipientAddress: $recipientAddress, recipientPincode: $recipientPincode, status: $status, priority: $priority, deliverySequence: $deliverySequence, parcelType: $parcelType, isCod: $isCod, codAmount: $codAmount, weightGrams: $weightGrams, hasCustomerPin: $hasCustomerPin, deliveryLat: $deliveryLat, deliveryLng: $deliveryLng)';
}


}

/// @nodoc
abstract mixin class $ParcelCopyWith<$Res>  {
  factory $ParcelCopyWith(Parcel value, $Res Function(Parcel) _then) = _$ParcelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'tracking_number') String trackingNumber,@JsonKey(name: 'recipient_name') String recipientName,@JsonKey(name: 'recipient_phone') String? recipientPhone,@JsonKey(name: 'recipient_address') String recipientAddress,@JsonKey(name: 'recipient_pincode') String recipientPincode,@JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson) DeliveryStatus status,@JsonKey(name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson) DeliveryPriority priority,@JsonKey(name: 'delivery_sequence') int? deliverySequence,@JsonKey(name: 'parcel_type') String? parcelType,@JsonKey(name: 'is_cod') bool isCod,@JsonKey(name: 'cod_amount') double codAmount,@JsonKey(name: 'weight_grams') int weightGrams,@JsonKey(name: 'has_customer_pin') bool hasCustomerPin,@JsonKey(name: 'delivery_lat') double? deliveryLat,@JsonKey(name: 'delivery_lng') double? deliveryLng
});




}
/// @nodoc
class _$ParcelCopyWithImpl<$Res>
    implements $ParcelCopyWith<$Res> {
  _$ParcelCopyWithImpl(this._self, this._then);

  final Parcel _self;
  final $Res Function(Parcel) _then;

/// Create a copy of Parcel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? trackingNumber = null,Object? recipientName = null,Object? recipientPhone = freezed,Object? recipientAddress = null,Object? recipientPincode = null,Object? status = null,Object? priority = null,Object? deliverySequence = freezed,Object? parcelType = freezed,Object? isCod = null,Object? codAmount = null,Object? weightGrams = null,Object? hasCustomerPin = null,Object? deliveryLat = freezed,Object? deliveryLng = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: null == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: freezed == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String?,recipientAddress: null == recipientAddress ? _self.recipientAddress : recipientAddress // ignore: cast_nullable_to_non_nullable
as String,recipientPincode: null == recipientPincode ? _self.recipientPincode : recipientPincode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeliveryStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as DeliveryPriority,deliverySequence: freezed == deliverySequence ? _self.deliverySequence : deliverySequence // ignore: cast_nullable_to_non_nullable
as int?,parcelType: freezed == parcelType ? _self.parcelType : parcelType // ignore: cast_nullable_to_non_nullable
as String?,isCod: null == isCod ? _self.isCod : isCod // ignore: cast_nullable_to_non_nullable
as bool,codAmount: null == codAmount ? _self.codAmount : codAmount // ignore: cast_nullable_to_non_nullable
as double,weightGrams: null == weightGrams ? _self.weightGrams : weightGrams // ignore: cast_nullable_to_non_nullable
as int,hasCustomerPin: null == hasCustomerPin ? _self.hasCustomerPin : hasCustomerPin // ignore: cast_nullable_to_non_nullable
as bool,deliveryLat: freezed == deliveryLat ? _self.deliveryLat : deliveryLat // ignore: cast_nullable_to_non_nullable
as double?,deliveryLng: freezed == deliveryLng ? _self.deliveryLng : deliveryLng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Parcel].
extension ParcelPatterns on Parcel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Parcel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Parcel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Parcel value)  $default,){
final _that = this;
switch (_that) {
case _Parcel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Parcel value)?  $default,){
final _that = this;
switch (_that) {
case _Parcel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'recipient_name')  String recipientName, @JsonKey(name: 'recipient_phone')  String? recipientPhone, @JsonKey(name: 'recipient_address')  String recipientAddress, @JsonKey(name: 'recipient_pincode')  String recipientPincode, @JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson)  DeliveryStatus status, @JsonKey(name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson)  DeliveryPriority priority, @JsonKey(name: 'delivery_sequence')  int? deliverySequence, @JsonKey(name: 'parcel_type')  String? parcelType, @JsonKey(name: 'is_cod')  bool isCod, @JsonKey(name: 'cod_amount')  double codAmount, @JsonKey(name: 'weight_grams')  int weightGrams, @JsonKey(name: 'has_customer_pin')  bool hasCustomerPin, @JsonKey(name: 'delivery_lat')  double? deliveryLat, @JsonKey(name: 'delivery_lng')  double? deliveryLng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Parcel() when $default != null:
return $default(_that.id,_that.trackingNumber,_that.recipientName,_that.recipientPhone,_that.recipientAddress,_that.recipientPincode,_that.status,_that.priority,_that.deliverySequence,_that.parcelType,_that.isCod,_that.codAmount,_that.weightGrams,_that.hasCustomerPin,_that.deliveryLat,_that.deliveryLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'recipient_name')  String recipientName, @JsonKey(name: 'recipient_phone')  String? recipientPhone, @JsonKey(name: 'recipient_address')  String recipientAddress, @JsonKey(name: 'recipient_pincode')  String recipientPincode, @JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson)  DeliveryStatus status, @JsonKey(name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson)  DeliveryPriority priority, @JsonKey(name: 'delivery_sequence')  int? deliverySequence, @JsonKey(name: 'parcel_type')  String? parcelType, @JsonKey(name: 'is_cod')  bool isCod, @JsonKey(name: 'cod_amount')  double codAmount, @JsonKey(name: 'weight_grams')  int weightGrams, @JsonKey(name: 'has_customer_pin')  bool hasCustomerPin, @JsonKey(name: 'delivery_lat')  double? deliveryLat, @JsonKey(name: 'delivery_lng')  double? deliveryLng)  $default,) {final _that = this;
switch (_that) {
case _Parcel():
return $default(_that.id,_that.trackingNumber,_that.recipientName,_that.recipientPhone,_that.recipientAddress,_that.recipientPincode,_that.status,_that.priority,_that.deliverySequence,_that.parcelType,_that.isCod,_that.codAmount,_that.weightGrams,_that.hasCustomerPin,_that.deliveryLat,_that.deliveryLng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'tracking_number')  String trackingNumber, @JsonKey(name: 'recipient_name')  String recipientName, @JsonKey(name: 'recipient_phone')  String? recipientPhone, @JsonKey(name: 'recipient_address')  String recipientAddress, @JsonKey(name: 'recipient_pincode')  String recipientPincode, @JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson)  DeliveryStatus status, @JsonKey(name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson)  DeliveryPriority priority, @JsonKey(name: 'delivery_sequence')  int? deliverySequence, @JsonKey(name: 'parcel_type')  String? parcelType, @JsonKey(name: 'is_cod')  bool isCod, @JsonKey(name: 'cod_amount')  double codAmount, @JsonKey(name: 'weight_grams')  int weightGrams, @JsonKey(name: 'has_customer_pin')  bool hasCustomerPin, @JsonKey(name: 'delivery_lat')  double? deliveryLat, @JsonKey(name: 'delivery_lng')  double? deliveryLng)?  $default,) {final _that = this;
switch (_that) {
case _Parcel() when $default != null:
return $default(_that.id,_that.trackingNumber,_that.recipientName,_that.recipientPhone,_that.recipientAddress,_that.recipientPincode,_that.status,_that.priority,_that.deliverySequence,_that.parcelType,_that.isCod,_that.codAmount,_that.weightGrams,_that.hasCustomerPin,_that.deliveryLat,_that.deliveryLng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Parcel extends Parcel {
  const _Parcel({required this.id, @JsonKey(name: 'tracking_number') required this.trackingNumber, @JsonKey(name: 'recipient_name') required this.recipientName, @JsonKey(name: 'recipient_phone') this.recipientPhone, @JsonKey(name: 'recipient_address') required this.recipientAddress, @JsonKey(name: 'recipient_pincode') required this.recipientPincode, @JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson) required this.status, @JsonKey(name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson) this.priority = DeliveryPriority.normal, @JsonKey(name: 'delivery_sequence') this.deliverySequence, @JsonKey(name: 'parcel_type') this.parcelType, @JsonKey(name: 'is_cod') this.isCod = false, @JsonKey(name: 'cod_amount') this.codAmount = 0.0, @JsonKey(name: 'weight_grams') this.weightGrams = 0, @JsonKey(name: 'has_customer_pin') this.hasCustomerPin = false, @JsonKey(name: 'delivery_lat') this.deliveryLat, @JsonKey(name: 'delivery_lng') this.deliveryLng}): super._();
  factory _Parcel.fromJson(Map<String, dynamic> json) => _$ParcelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'tracking_number') final  String trackingNumber;
@override@JsonKey(name: 'recipient_name') final  String recipientName;
@override@JsonKey(name: 'recipient_phone') final  String? recipientPhone;
@override@JsonKey(name: 'recipient_address') final  String recipientAddress;
@override@JsonKey(name: 'recipient_pincode') final  String recipientPincode;
@override@JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson) final  DeliveryStatus status;
@override@JsonKey(name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson) final  DeliveryPriority priority;
@override@JsonKey(name: 'delivery_sequence') final  int? deliverySequence;
@override@JsonKey(name: 'parcel_type') final  String? parcelType;
@override@JsonKey(name: 'is_cod') final  bool isCod;
@override@JsonKey(name: 'cod_amount') final  double codAmount;
@override@JsonKey(name: 'weight_grams') final  int weightGrams;
@override@JsonKey(name: 'has_customer_pin') final  bool hasCustomerPin;
@override@JsonKey(name: 'delivery_lat') final  double? deliveryLat;
@override@JsonKey(name: 'delivery_lng') final  double? deliveryLng;

/// Create a copy of Parcel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParcelCopyWith<_Parcel> get copyWith => __$ParcelCopyWithImpl<_Parcel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParcelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Parcel&&(identical(other.id, id) || other.id == id)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.recipientAddress, recipientAddress) || other.recipientAddress == recipientAddress)&&(identical(other.recipientPincode, recipientPincode) || other.recipientPincode == recipientPincode)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.deliverySequence, deliverySequence) || other.deliverySequence == deliverySequence)&&(identical(other.parcelType, parcelType) || other.parcelType == parcelType)&&(identical(other.isCod, isCod) || other.isCod == isCod)&&(identical(other.codAmount, codAmount) || other.codAmount == codAmount)&&(identical(other.weightGrams, weightGrams) || other.weightGrams == weightGrams)&&(identical(other.hasCustomerPin, hasCustomerPin) || other.hasCustomerPin == hasCustomerPin)&&(identical(other.deliveryLat, deliveryLat) || other.deliveryLat == deliveryLat)&&(identical(other.deliveryLng, deliveryLng) || other.deliveryLng == deliveryLng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trackingNumber,recipientName,recipientPhone,recipientAddress,recipientPincode,status,priority,deliverySequence,parcelType,isCod,codAmount,weightGrams,hasCustomerPin,deliveryLat,deliveryLng);

@override
String toString() {
  return 'Parcel(id: $id, trackingNumber: $trackingNumber, recipientName: $recipientName, recipientPhone: $recipientPhone, recipientAddress: $recipientAddress, recipientPincode: $recipientPincode, status: $status, priority: $priority, deliverySequence: $deliverySequence, parcelType: $parcelType, isCod: $isCod, codAmount: $codAmount, weightGrams: $weightGrams, hasCustomerPin: $hasCustomerPin, deliveryLat: $deliveryLat, deliveryLng: $deliveryLng)';
}


}

/// @nodoc
abstract mixin class _$ParcelCopyWith<$Res> implements $ParcelCopyWith<$Res> {
  factory _$ParcelCopyWith(_Parcel value, $Res Function(_Parcel) _then) = __$ParcelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'tracking_number') String trackingNumber,@JsonKey(name: 'recipient_name') String recipientName,@JsonKey(name: 'recipient_phone') String? recipientPhone,@JsonKey(name: 'recipient_address') String recipientAddress,@JsonKey(name: 'recipient_pincode') String recipientPincode,@JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson) DeliveryStatus status,@JsonKey(name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson) DeliveryPriority priority,@JsonKey(name: 'delivery_sequence') int? deliverySequence,@JsonKey(name: 'parcel_type') String? parcelType,@JsonKey(name: 'is_cod') bool isCod,@JsonKey(name: 'cod_amount') double codAmount,@JsonKey(name: 'weight_grams') int weightGrams,@JsonKey(name: 'has_customer_pin') bool hasCustomerPin,@JsonKey(name: 'delivery_lat') double? deliveryLat,@JsonKey(name: 'delivery_lng') double? deliveryLng
});




}
/// @nodoc
class __$ParcelCopyWithImpl<$Res>
    implements _$ParcelCopyWith<$Res> {
  __$ParcelCopyWithImpl(this._self, this._then);

  final _Parcel _self;
  final $Res Function(_Parcel) _then;

/// Create a copy of Parcel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? trackingNumber = null,Object? recipientName = null,Object? recipientPhone = freezed,Object? recipientAddress = null,Object? recipientPincode = null,Object? status = null,Object? priority = null,Object? deliverySequence = freezed,Object? parcelType = freezed,Object? isCod = null,Object? codAmount = null,Object? weightGrams = null,Object? hasCustomerPin = null,Object? deliveryLat = freezed,Object? deliveryLng = freezed,}) {
  return _then(_Parcel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: null == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: freezed == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String?,recipientAddress: null == recipientAddress ? _self.recipientAddress : recipientAddress // ignore: cast_nullable_to_non_nullable
as String,recipientPincode: null == recipientPincode ? _self.recipientPincode : recipientPincode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeliveryStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as DeliveryPriority,deliverySequence: freezed == deliverySequence ? _self.deliverySequence : deliverySequence // ignore: cast_nullable_to_non_nullable
as int?,parcelType: freezed == parcelType ? _self.parcelType : parcelType // ignore: cast_nullable_to_non_nullable
as String?,isCod: null == isCod ? _self.isCod : isCod // ignore: cast_nullable_to_non_nullable
as bool,codAmount: null == codAmount ? _self.codAmount : codAmount // ignore: cast_nullable_to_non_nullable
as double,weightGrams: null == weightGrams ? _self.weightGrams : weightGrams // ignore: cast_nullable_to_non_nullable
as int,hasCustomerPin: null == hasCustomerPin ? _self.hasCustomerPin : hasCustomerPin // ignore: cast_nullable_to_non_nullable
as bool,deliveryLat: freezed == deliveryLat ? _self.deliveryLat : deliveryLat // ignore: cast_nullable_to_non_nullable
as double?,deliveryLng: freezed == deliveryLng ? _self.deliveryLng : deliveryLng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
