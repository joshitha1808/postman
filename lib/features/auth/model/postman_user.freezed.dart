// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postman_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostmanUser {

 String get id;@JsonKey(name: 'employee_id') String get employeeId; String get name; String get phone;@JsonKey(name: 'post_office_code') String get postOfficeCode;@JsonKey(name: 'beat_area') String? get beatArea;@JsonKey(name: 'is_on_duty') bool get isOnDuty;@JsonKey(name: 'profile_photo_url') String? get profilePhotoUrl;@JsonKey(name: 'today_stats') TodayStats? get todayStats;
/// Create a copy of PostmanUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostmanUserCopyWith<PostmanUser> get copyWith => _$PostmanUserCopyWithImpl<PostmanUser>(this as PostmanUser, _$identity);

  /// Serializes this PostmanUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostmanUser&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.postOfficeCode, postOfficeCode) || other.postOfficeCode == postOfficeCode)&&(identical(other.beatArea, beatArea) || other.beatArea == beatArea)&&(identical(other.isOnDuty, isOnDuty) || other.isOnDuty == isOnDuty)&&(identical(other.profilePhotoUrl, profilePhotoUrl) || other.profilePhotoUrl == profilePhotoUrl)&&(identical(other.todayStats, todayStats) || other.todayStats == todayStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,name,phone,postOfficeCode,beatArea,isOnDuty,profilePhotoUrl,todayStats);

@override
String toString() {
  return 'PostmanUser(id: $id, employeeId: $employeeId, name: $name, phone: $phone, postOfficeCode: $postOfficeCode, beatArea: $beatArea, isOnDuty: $isOnDuty, profilePhotoUrl: $profilePhotoUrl, todayStats: $todayStats)';
}


}

/// @nodoc
abstract mixin class $PostmanUserCopyWith<$Res>  {
  factory $PostmanUserCopyWith(PostmanUser value, $Res Function(PostmanUser) _then) = _$PostmanUserCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'employee_id') String employeeId, String name, String phone,@JsonKey(name: 'post_office_code') String postOfficeCode,@JsonKey(name: 'beat_area') String? beatArea,@JsonKey(name: 'is_on_duty') bool isOnDuty,@JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,@JsonKey(name: 'today_stats') TodayStats? todayStats
});


$TodayStatsCopyWith<$Res>? get todayStats;

}
/// @nodoc
class _$PostmanUserCopyWithImpl<$Res>
    implements $PostmanUserCopyWith<$Res> {
  _$PostmanUserCopyWithImpl(this._self, this._then);

  final PostmanUser _self;
  final $Res Function(PostmanUser) _then;

/// Create a copy of PostmanUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? employeeId = null,Object? name = null,Object? phone = null,Object? postOfficeCode = null,Object? beatArea = freezed,Object? isOnDuty = null,Object? profilePhotoUrl = freezed,Object? todayStats = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,postOfficeCode: null == postOfficeCode ? _self.postOfficeCode : postOfficeCode // ignore: cast_nullable_to_non_nullable
as String,beatArea: freezed == beatArea ? _self.beatArea : beatArea // ignore: cast_nullable_to_non_nullable
as String?,isOnDuty: null == isOnDuty ? _self.isOnDuty : isOnDuty // ignore: cast_nullable_to_non_nullable
as bool,profilePhotoUrl: freezed == profilePhotoUrl ? _self.profilePhotoUrl : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,todayStats: freezed == todayStats ? _self.todayStats : todayStats // ignore: cast_nullable_to_non_nullable
as TodayStats?,
  ));
}
/// Create a copy of PostmanUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodayStatsCopyWith<$Res>? get todayStats {
    if (_self.todayStats == null) {
    return null;
  }

  return $TodayStatsCopyWith<$Res>(_self.todayStats!, (value) {
    return _then(_self.copyWith(todayStats: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostmanUser].
extension PostmanUserPatterns on PostmanUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostmanUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostmanUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostmanUser value)  $default,){
final _that = this;
switch (_that) {
case _PostmanUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostmanUser value)?  $default,){
final _that = this;
switch (_that) {
case _PostmanUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'employee_id')  String employeeId,  String name,  String phone, @JsonKey(name: 'post_office_code')  String postOfficeCode, @JsonKey(name: 'beat_area')  String? beatArea, @JsonKey(name: 'is_on_duty')  bool isOnDuty, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl, @JsonKey(name: 'today_stats')  TodayStats? todayStats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostmanUser() when $default != null:
return $default(_that.id,_that.employeeId,_that.name,_that.phone,_that.postOfficeCode,_that.beatArea,_that.isOnDuty,_that.profilePhotoUrl,_that.todayStats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'employee_id')  String employeeId,  String name,  String phone, @JsonKey(name: 'post_office_code')  String postOfficeCode, @JsonKey(name: 'beat_area')  String? beatArea, @JsonKey(name: 'is_on_duty')  bool isOnDuty, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl, @JsonKey(name: 'today_stats')  TodayStats? todayStats)  $default,) {final _that = this;
switch (_that) {
case _PostmanUser():
return $default(_that.id,_that.employeeId,_that.name,_that.phone,_that.postOfficeCode,_that.beatArea,_that.isOnDuty,_that.profilePhotoUrl,_that.todayStats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'employee_id')  String employeeId,  String name,  String phone, @JsonKey(name: 'post_office_code')  String postOfficeCode, @JsonKey(name: 'beat_area')  String? beatArea, @JsonKey(name: 'is_on_duty')  bool isOnDuty, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl, @JsonKey(name: 'today_stats')  TodayStats? todayStats)?  $default,) {final _that = this;
switch (_that) {
case _PostmanUser() when $default != null:
return $default(_that.id,_that.employeeId,_that.name,_that.phone,_that.postOfficeCode,_that.beatArea,_that.isOnDuty,_that.profilePhotoUrl,_that.todayStats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostmanUser implements PostmanUser {
  const _PostmanUser({required this.id, @JsonKey(name: 'employee_id') required this.employeeId, required this.name, required this.phone, @JsonKey(name: 'post_office_code') required this.postOfficeCode, @JsonKey(name: 'beat_area') this.beatArea, @JsonKey(name: 'is_on_duty') required this.isOnDuty, @JsonKey(name: 'profile_photo_url') this.profilePhotoUrl, @JsonKey(name: 'today_stats') this.todayStats});
  factory _PostmanUser.fromJson(Map<String, dynamic> json) => _$PostmanUserFromJson(json);

@override final  String id;
@override@JsonKey(name: 'employee_id') final  String employeeId;
@override final  String name;
@override final  String phone;
@override@JsonKey(name: 'post_office_code') final  String postOfficeCode;
@override@JsonKey(name: 'beat_area') final  String? beatArea;
@override@JsonKey(name: 'is_on_duty') final  bool isOnDuty;
@override@JsonKey(name: 'profile_photo_url') final  String? profilePhotoUrl;
@override@JsonKey(name: 'today_stats') final  TodayStats? todayStats;

/// Create a copy of PostmanUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostmanUserCopyWith<_PostmanUser> get copyWith => __$PostmanUserCopyWithImpl<_PostmanUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostmanUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostmanUser&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.postOfficeCode, postOfficeCode) || other.postOfficeCode == postOfficeCode)&&(identical(other.beatArea, beatArea) || other.beatArea == beatArea)&&(identical(other.isOnDuty, isOnDuty) || other.isOnDuty == isOnDuty)&&(identical(other.profilePhotoUrl, profilePhotoUrl) || other.profilePhotoUrl == profilePhotoUrl)&&(identical(other.todayStats, todayStats) || other.todayStats == todayStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,name,phone,postOfficeCode,beatArea,isOnDuty,profilePhotoUrl,todayStats);

@override
String toString() {
  return 'PostmanUser(id: $id, employeeId: $employeeId, name: $name, phone: $phone, postOfficeCode: $postOfficeCode, beatArea: $beatArea, isOnDuty: $isOnDuty, profilePhotoUrl: $profilePhotoUrl, todayStats: $todayStats)';
}


}

/// @nodoc
abstract mixin class _$PostmanUserCopyWith<$Res> implements $PostmanUserCopyWith<$Res> {
  factory _$PostmanUserCopyWith(_PostmanUser value, $Res Function(_PostmanUser) _then) = __$PostmanUserCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'employee_id') String employeeId, String name, String phone,@JsonKey(name: 'post_office_code') String postOfficeCode,@JsonKey(name: 'beat_area') String? beatArea,@JsonKey(name: 'is_on_duty') bool isOnDuty,@JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,@JsonKey(name: 'today_stats') TodayStats? todayStats
});


@override $TodayStatsCopyWith<$Res>? get todayStats;

}
/// @nodoc
class __$PostmanUserCopyWithImpl<$Res>
    implements _$PostmanUserCopyWith<$Res> {
  __$PostmanUserCopyWithImpl(this._self, this._then);

  final _PostmanUser _self;
  final $Res Function(_PostmanUser) _then;

/// Create a copy of PostmanUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? employeeId = null,Object? name = null,Object? phone = null,Object? postOfficeCode = null,Object? beatArea = freezed,Object? isOnDuty = null,Object? profilePhotoUrl = freezed,Object? todayStats = freezed,}) {
  return _then(_PostmanUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,postOfficeCode: null == postOfficeCode ? _self.postOfficeCode : postOfficeCode // ignore: cast_nullable_to_non_nullable
as String,beatArea: freezed == beatArea ? _self.beatArea : beatArea // ignore: cast_nullable_to_non_nullable
as String?,isOnDuty: null == isOnDuty ? _self.isOnDuty : isOnDuty // ignore: cast_nullable_to_non_nullable
as bool,profilePhotoUrl: freezed == profilePhotoUrl ? _self.profilePhotoUrl : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,todayStats: freezed == todayStats ? _self.todayStats : todayStats // ignore: cast_nullable_to_non_nullable
as TodayStats?,
  ));
}

/// Create a copy of PostmanUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodayStatsCopyWith<$Res>? get todayStats {
    if (_self.todayStats == null) {
    return null;
  }

  return $TodayStatsCopyWith<$Res>(_self.todayStats!, (value) {
    return _then(_self.copyWith(todayStats: value));
  });
}
}

// dart format on
