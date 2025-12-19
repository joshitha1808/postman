// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodayStats _$TodayStatsFromJson(Map<String, dynamic> json) => _TodayStats(
  totalAssigned: (json['total_assigned'] as num).toInt(),
  delivered: (json['delivered'] as num).toInt(),
  pending: (json['pending'] as num).toInt(),
  failed: (json['failed'] as num).toInt(),
);

Map<String, dynamic> _$TodayStatsToJson(_TodayStats instance) =>
    <String, dynamic>{
      'total_assigned': instance.totalAssigned,
      'delivered': instance.delivered,
      'pending': instance.pending,
      'failed': instance.failed,
    };
