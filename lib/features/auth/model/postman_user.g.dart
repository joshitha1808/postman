// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postman_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostmanUser _$PostmanUserFromJson(Map<String, dynamic> json) => _PostmanUser(
  id: json['id'] as String,
  employeeId: json['employee_id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  postOfficeCode: json['post_office_code'] as String,
  beatArea: json['beat_area'] as String?,
  isOnDuty: json['is_on_duty'] as bool,
  profilePhotoUrl: json['profile_photo_url'] as String?,
  todayStats: json['today_stats'] == null
      ? null
      : TodayStats.fromJson(json['today_stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostmanUserToJson(_PostmanUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'name': instance.name,
      'phone': instance.phone,
      'post_office_code': instance.postOfficeCode,
      'beat_area': instance.beatArea,
      'is_on_duty': instance.isOnDuty,
      'profile_photo_url': instance.profilePhotoUrl,
      'today_stats': instance.todayStats,
    };
