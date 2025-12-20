// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationUpdate _$LocationUpdateFromJson(Map<String, dynamic> json) =>
    _LocationUpdate(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      timestamp: json['timestamp'] as String,
      batteryLevel: (json['battery_level'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LocationUpdateToJson(_LocationUpdate instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'heading': instance.heading,
      'timestamp': instance.timestamp,
      'battery_level': instance.batteryLevel,
    };

_LocationUpdateResponse _$LocationUpdateResponseFromJson(
  Map<String, dynamic> json,
) => _LocationUpdateResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  lastUpdated: json['last_updated'] as String?,
);

Map<String, dynamic> _$LocationUpdateResponseToJson(
  _LocationUpdateResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'last_updated': instance.lastUpdated,
};

_CurrentLocationResponse _$CurrentLocationResponseFromJson(
  Map<String, dynamic> json,
) => _CurrentLocationResponse(
  postmanId: json['postman_id'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  lastUpdated: json['last_updated'] as String,
  isOnDuty: json['is_on_duty'] as bool,
);

Map<String, dynamic> _$CurrentLocationResponseToJson(
  _CurrentLocationResponse instance,
) => <String, dynamic>{
  'postman_id': instance.postmanId,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'last_updated': instance.lastUpdated,
  'is_on_duty': instance.isOnDuty,
};

_LocationMessage _$LocationMessageFromJson(Map<String, dynamic> json) =>
    _LocationMessage(
      type: $enumDecode(_$LocationMessageTypeEnumMap, json['type']),
      data: json['data'] == null
          ? null
          : LocationUpdate.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LocationMessageToJson(_LocationMessage instance) =>
    <String, dynamic>{
      'type': _$LocationMessageTypeEnumMap[instance.type]!,
      'data': instance.data,
      'message': instance.message,
    };

const _$LocationMessageTypeEnumMap = {
  LocationMessageType.locationUpdate: 'location_update',
  LocationMessageType.ping: 'ping',
  LocationMessageType.pong: 'pong',
  LocationMessageType.ack: 'ack',
  LocationMessageType.error: 'error',
};
