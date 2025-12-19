// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatusUpdateRequest _$StatusUpdateRequestFromJson(Map<String, dynamic> json) =>
    _StatusUpdateRequest(
      newStatus: json['new_status'] as String,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      failureReason: json['failure_reason'] as String?,
      failureNotes: json['failure_notes'] as String?,
      clientTimestamp: json['client_timestamp'] as String?,
      clientUpdateId: json['client_update_id'] as String?,
    );

Map<String, dynamic> _$StatusUpdateRequestToJson(
  _StatusUpdateRequest instance,
) => <String, dynamic>{
  'new_status': instance.newStatus,
  'lat': instance.lat,
  'lng': instance.lng,
  'failure_reason': instance.failureReason,
  'failure_notes': instance.failureNotes,
  'client_timestamp': instance.clientTimestamp,
  'client_update_id': instance.clientUpdateId,
};

_StatusUpdateResponse _$StatusUpdateResponseFromJson(
  Map<String, dynamic> json,
) => _StatusUpdateResponse(
  parcelId: json['parcel_id'] as String,
  trackingNumber: json['tracking_number'] as String,
  previousStatus: json['previous_status'] as String,
  newStatus: json['new_status'] as String,
  updatedAt: json['updated_at'] as String,
  isDuplicate: json['is_duplicate'] as bool? ?? false,
);

Map<String, dynamic> _$StatusUpdateResponseToJson(
  _StatusUpdateResponse instance,
) => <String, dynamic>{
  'parcel_id': instance.parcelId,
  'tracking_number': instance.trackingNumber,
  'previous_status': instance.previousStatus,
  'new_status': instance.newStatus,
  'updated_at': instance.updatedAt,
  'is_duplicate': instance.isDuplicate,
};
