import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postman/features/auth/model/today_stats.dart';

part 'postman_user.freezed.dart';
part 'postman_user.g.dart';

/// Represents the authenticated postman user
@freezed
abstract class PostmanUser with _$PostmanUser {
  const factory PostmanUser({
    required String id,
    @JsonKey(name: 'employee_id') required String employeeId,
    required String name,
    required String phone,
    @JsonKey(name: 'post_office_code') required String postOfficeCode,
    @JsonKey(name: 'beat_area') String? beatArea,
    @JsonKey(name: 'is_on_duty') required bool isOnDuty,
    @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
    @JsonKey(name: 'today_stats') TodayStats? todayStats,
  }) = _PostmanUser;

  factory PostmanUser.fromJson(Map<String, dynamic> json) =>
      _$PostmanUserFromJson(json);
}
