// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryList _$DeliveryListFromJson(Map<String, dynamic> json) =>
    _DeliveryList(
      date: DateTime.parse(json['date'] as String),
      postmanId: json['postman_id'] as String,
      totalParcels: (json['total_parcels'] as num).toInt(),
      pendingCount: (json['pending_count'] as num).toInt(),
      deliveredCount: (json['delivered_count'] as num).toInt(),
      failedCount: (json['failed_count'] as num).toInt(),
      parcels: (json['parcels'] as List<dynamic>)
          .map((e) => Parcel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeliveryListToJson(_DeliveryList instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'postman_id': instance.postmanId,
      'total_parcels': instance.totalParcels,
      'pending_count': instance.pendingCount,
      'delivered_count': instance.deliveredCount,
      'failed_count': instance.failedCount,
      'parcels': instance.parcels,
    };
