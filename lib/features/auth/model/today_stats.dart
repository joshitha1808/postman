import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_stats.freezed.dart';
part 'today_stats.g.dart';

/// Today's delivery statistics for the postman
@freezed
abstract class TodayStats with _$TodayStats {
  const factory TodayStats({
    @JsonKey(name: 'total_assigned') required int totalAssigned,
    required int delivered,
    required int pending,
    required int failed,
  }) = _TodayStats;

  factory TodayStats.fromJson(Map<String, dynamic> json) =>
      _$TodayStatsFromJson(json);
}
