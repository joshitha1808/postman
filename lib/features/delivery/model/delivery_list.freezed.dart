// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryList {

 DateTime get date;@JsonKey(name: 'postman_id') String get postmanId;@JsonKey(name: 'total_parcels') int get totalParcels;@JsonKey(name: 'pending_count') int get pendingCount;@JsonKey(name: 'delivered_count') int get deliveredCount;@JsonKey(name: 'failed_count') int get failedCount; List<Parcel> get parcels;
/// Create a copy of DeliveryList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryListCopyWith<DeliveryList> get copyWith => _$DeliveryListCopyWithImpl<DeliveryList>(this as DeliveryList, _$identity);

  /// Serializes this DeliveryList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryList&&(identical(other.date, date) || other.date == date)&&(identical(other.postmanId, postmanId) || other.postmanId == postmanId)&&(identical(other.totalParcels, totalParcels) || other.totalParcels == totalParcels)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.deliveredCount, deliveredCount) || other.deliveredCount == deliveredCount)&&(identical(other.failedCount, failedCount) || other.failedCount == failedCount)&&const DeepCollectionEquality().equals(other.parcels, parcels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,postmanId,totalParcels,pendingCount,deliveredCount,failedCount,const DeepCollectionEquality().hash(parcels));

@override
String toString() {
  return 'DeliveryList(date: $date, postmanId: $postmanId, totalParcels: $totalParcels, pendingCount: $pendingCount, deliveredCount: $deliveredCount, failedCount: $failedCount, parcels: $parcels)';
}


}

/// @nodoc
abstract mixin class $DeliveryListCopyWith<$Res>  {
  factory $DeliveryListCopyWith(DeliveryList value, $Res Function(DeliveryList) _then) = _$DeliveryListCopyWithImpl;
@useResult
$Res call({
 DateTime date,@JsonKey(name: 'postman_id') String postmanId,@JsonKey(name: 'total_parcels') int totalParcels,@JsonKey(name: 'pending_count') int pendingCount,@JsonKey(name: 'delivered_count') int deliveredCount,@JsonKey(name: 'failed_count') int failedCount, List<Parcel> parcels
});




}
/// @nodoc
class _$DeliveryListCopyWithImpl<$Res>
    implements $DeliveryListCopyWith<$Res> {
  _$DeliveryListCopyWithImpl(this._self, this._then);

  final DeliveryList _self;
  final $Res Function(DeliveryList) _then;

/// Create a copy of DeliveryList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? postmanId = null,Object? totalParcels = null,Object? pendingCount = null,Object? deliveredCount = null,Object? failedCount = null,Object? parcels = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,postmanId: null == postmanId ? _self.postmanId : postmanId // ignore: cast_nullable_to_non_nullable
as String,totalParcels: null == totalParcels ? _self.totalParcels : totalParcels // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,deliveredCount: null == deliveredCount ? _self.deliveredCount : deliveredCount // ignore: cast_nullable_to_non_nullable
as int,failedCount: null == failedCount ? _self.failedCount : failedCount // ignore: cast_nullable_to_non_nullable
as int,parcels: null == parcels ? _self.parcels : parcels // ignore: cast_nullable_to_non_nullable
as List<Parcel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryList].
extension DeliveryListPatterns on DeliveryList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryList value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryList value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(name: 'postman_id')  String postmanId, @JsonKey(name: 'total_parcels')  int totalParcels, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'delivered_count')  int deliveredCount, @JsonKey(name: 'failed_count')  int failedCount,  List<Parcel> parcels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryList() when $default != null:
return $default(_that.date,_that.postmanId,_that.totalParcels,_that.pendingCount,_that.deliveredCount,_that.failedCount,_that.parcels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(name: 'postman_id')  String postmanId, @JsonKey(name: 'total_parcels')  int totalParcels, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'delivered_count')  int deliveredCount, @JsonKey(name: 'failed_count')  int failedCount,  List<Parcel> parcels)  $default,) {final _that = this;
switch (_that) {
case _DeliveryList():
return $default(_that.date,_that.postmanId,_that.totalParcels,_that.pendingCount,_that.deliveredCount,_that.failedCount,_that.parcels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date, @JsonKey(name: 'postman_id')  String postmanId, @JsonKey(name: 'total_parcels')  int totalParcels, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'delivered_count')  int deliveredCount, @JsonKey(name: 'failed_count')  int failedCount,  List<Parcel> parcels)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryList() when $default != null:
return $default(_that.date,_that.postmanId,_that.totalParcels,_that.pendingCount,_that.deliveredCount,_that.failedCount,_that.parcels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryList extends DeliveryList {
  const _DeliveryList({required this.date, @JsonKey(name: 'postman_id') required this.postmanId, @JsonKey(name: 'total_parcels') required this.totalParcels, @JsonKey(name: 'pending_count') required this.pendingCount, @JsonKey(name: 'delivered_count') required this.deliveredCount, @JsonKey(name: 'failed_count') required this.failedCount, required final  List<Parcel> parcels}): _parcels = parcels,super._();
  factory _DeliveryList.fromJson(Map<String, dynamic> json) => _$DeliveryListFromJson(json);

@override final  DateTime date;
@override@JsonKey(name: 'postman_id') final  String postmanId;
@override@JsonKey(name: 'total_parcels') final  int totalParcels;
@override@JsonKey(name: 'pending_count') final  int pendingCount;
@override@JsonKey(name: 'delivered_count') final  int deliveredCount;
@override@JsonKey(name: 'failed_count') final  int failedCount;
 final  List<Parcel> _parcels;
@override List<Parcel> get parcels {
  if (_parcels is EqualUnmodifiableListView) return _parcels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parcels);
}


/// Create a copy of DeliveryList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryListCopyWith<_DeliveryList> get copyWith => __$DeliveryListCopyWithImpl<_DeliveryList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryList&&(identical(other.date, date) || other.date == date)&&(identical(other.postmanId, postmanId) || other.postmanId == postmanId)&&(identical(other.totalParcels, totalParcels) || other.totalParcels == totalParcels)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.deliveredCount, deliveredCount) || other.deliveredCount == deliveredCount)&&(identical(other.failedCount, failedCount) || other.failedCount == failedCount)&&const DeepCollectionEquality().equals(other._parcels, _parcels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,postmanId,totalParcels,pendingCount,deliveredCount,failedCount,const DeepCollectionEquality().hash(_parcels));

@override
String toString() {
  return 'DeliveryList(date: $date, postmanId: $postmanId, totalParcels: $totalParcels, pendingCount: $pendingCount, deliveredCount: $deliveredCount, failedCount: $failedCount, parcels: $parcels)';
}


}

/// @nodoc
abstract mixin class _$DeliveryListCopyWith<$Res> implements $DeliveryListCopyWith<$Res> {
  factory _$DeliveryListCopyWith(_DeliveryList value, $Res Function(_DeliveryList) _then) = __$DeliveryListCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@JsonKey(name: 'postman_id') String postmanId,@JsonKey(name: 'total_parcels') int totalParcels,@JsonKey(name: 'pending_count') int pendingCount,@JsonKey(name: 'delivered_count') int deliveredCount,@JsonKey(name: 'failed_count') int failedCount, List<Parcel> parcels
});




}
/// @nodoc
class __$DeliveryListCopyWithImpl<$Res>
    implements _$DeliveryListCopyWith<$Res> {
  __$DeliveryListCopyWithImpl(this._self, this._then);

  final _DeliveryList _self;
  final $Res Function(_DeliveryList) _then;

/// Create a copy of DeliveryList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? postmanId = null,Object? totalParcels = null,Object? pendingCount = null,Object? deliveredCount = null,Object? failedCount = null,Object? parcels = null,}) {
  return _then(_DeliveryList(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,postmanId: null == postmanId ? _self.postmanId : postmanId // ignore: cast_nullable_to_non_nullable
as String,totalParcels: null == totalParcels ? _self.totalParcels : totalParcels // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,deliveredCount: null == deliveredCount ? _self.deliveredCount : deliveredCount // ignore: cast_nullable_to_non_nullable
as int,failedCount: null == failedCount ? _self.failedCount : failedCount // ignore: cast_nullable_to_non_nullable
as int,parcels: null == parcels ? _self._parcels : parcels // ignore: cast_nullable_to_non_nullable
as List<Parcel>,
  ));
}


}

// dart format on
