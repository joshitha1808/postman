// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayStats {

@JsonKey(name: 'total_assigned') int get totalAssigned; int get delivered; int get pending; int get failed;
/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayStatsCopyWith<TodayStats> get copyWith => _$TodayStatsCopyWithImpl<TodayStats>(this as TodayStats, _$identity);

  /// Serializes this TodayStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayStats&&(identical(other.totalAssigned, totalAssigned) || other.totalAssigned == totalAssigned)&&(identical(other.delivered, delivered) || other.delivered == delivered)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.failed, failed) || other.failed == failed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAssigned,delivered,pending,failed);

@override
String toString() {
  return 'TodayStats(totalAssigned: $totalAssigned, delivered: $delivered, pending: $pending, failed: $failed)';
}


}

/// @nodoc
abstract mixin class $TodayStatsCopyWith<$Res>  {
  factory $TodayStatsCopyWith(TodayStats value, $Res Function(TodayStats) _then) = _$TodayStatsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_assigned') int totalAssigned, int delivered, int pending, int failed
});




}
/// @nodoc
class _$TodayStatsCopyWithImpl<$Res>
    implements $TodayStatsCopyWith<$Res> {
  _$TodayStatsCopyWithImpl(this._self, this._then);

  final TodayStats _self;
  final $Res Function(TodayStats) _then;

/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAssigned = null,Object? delivered = null,Object? pending = null,Object? failed = null,}) {
  return _then(_self.copyWith(
totalAssigned: null == totalAssigned ? _self.totalAssigned : totalAssigned // ignore: cast_nullable_to_non_nullable
as int,delivered: null == delivered ? _self.delivered : delivered // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,failed: null == failed ? _self.failed : failed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TodayStats].
extension TodayStatsPatterns on TodayStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayStats value)  $default,){
final _that = this;
switch (_that) {
case _TodayStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayStats value)?  $default,){
final _that = this;
switch (_that) {
case _TodayStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_assigned')  int totalAssigned,  int delivered,  int pending,  int failed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayStats() when $default != null:
return $default(_that.totalAssigned,_that.delivered,_that.pending,_that.failed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_assigned')  int totalAssigned,  int delivered,  int pending,  int failed)  $default,) {final _that = this;
switch (_that) {
case _TodayStats():
return $default(_that.totalAssigned,_that.delivered,_that.pending,_that.failed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_assigned')  int totalAssigned,  int delivered,  int pending,  int failed)?  $default,) {final _that = this;
switch (_that) {
case _TodayStats() when $default != null:
return $default(_that.totalAssigned,_that.delivered,_that.pending,_that.failed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayStats implements TodayStats {
  const _TodayStats({@JsonKey(name: 'total_assigned') required this.totalAssigned, required this.delivered, required this.pending, required this.failed});
  factory _TodayStats.fromJson(Map<String, dynamic> json) => _$TodayStatsFromJson(json);

@override@JsonKey(name: 'total_assigned') final  int totalAssigned;
@override final  int delivered;
@override final  int pending;
@override final  int failed;

/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayStatsCopyWith<_TodayStats> get copyWith => __$TodayStatsCopyWithImpl<_TodayStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayStats&&(identical(other.totalAssigned, totalAssigned) || other.totalAssigned == totalAssigned)&&(identical(other.delivered, delivered) || other.delivered == delivered)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.failed, failed) || other.failed == failed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAssigned,delivered,pending,failed);

@override
String toString() {
  return 'TodayStats(totalAssigned: $totalAssigned, delivered: $delivered, pending: $pending, failed: $failed)';
}


}

/// @nodoc
abstract mixin class _$TodayStatsCopyWith<$Res> implements $TodayStatsCopyWith<$Res> {
  factory _$TodayStatsCopyWith(_TodayStats value, $Res Function(_TodayStats) _then) = __$TodayStatsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_assigned') int totalAssigned, int delivered, int pending, int failed
});




}
/// @nodoc
class __$TodayStatsCopyWithImpl<$Res>
    implements _$TodayStatsCopyWith<$Res> {
  __$TodayStatsCopyWithImpl(this._self, this._then);

  final _TodayStats _self;
  final $Res Function(_TodayStats) _then;

/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAssigned = null,Object? delivered = null,Object? pending = null,Object? failed = null,}) {
  return _then(_TodayStats(
totalAssigned: null == totalAssigned ? _self.totalAssigned : totalAssigned // ignore: cast_nullable_to_non_nullable
as int,delivered: null == delivered ? _self.delivered : delivered // ignore: cast_nullable_to_non_nullable
as int,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as int,failed: null == failed ? _self.failed : failed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
