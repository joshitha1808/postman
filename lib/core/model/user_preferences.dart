// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class UserPreferences {
  @Id()
  int? id;

  String pfpPath;
  bool isPrivacyEnabled;
  bool isDarkModeEnabled;
  String? appTheme;
  bool isFirstLaunch;

  UserPreferences({
    this.id,
    this.pfpPath = "assets/images/pfp/default.png",
    this.isPrivacyEnabled = true,
    this.isDarkModeEnabled = false,
    this.appTheme = 'blue',
    this.isFirstLaunch = true,
  });

  UserPreferences copyWith({
    int? id,
    String? pfpPath,
    bool? isTimetableNotificationsEnabled,
    bool? isExamScheduleNotificationEnabled,
    int? timetableNotificationDelay,
    int? examScheduleNotificationDelay,
    bool? isPrivacyEnabled,
    bool? isDarkModeEnabled,
    bool? bypassWeekendOutingRestriction,
    String? appTheme,
    double? fontScale,
    DateTime? lastSync,
    DateTime? attendanceLastSync,
    DateTime? marksLastSync,
    DateTime? examScheduleLastSync,
    bool? isFirstLaunch,
  }) {
    return UserPreferences(
      id: id ?? this.id,
      pfpPath: pfpPath ?? this.pfpPath,
      isPrivacyEnabled: isPrivacyEnabled ?? this.isPrivacyEnabled,
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
      appTheme: appTheme ?? this.appTheme,
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
    );
  }
}
