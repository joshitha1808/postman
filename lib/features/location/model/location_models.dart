import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_models.freezed.dart';
part 'location_models.g.dart';

/// Location update sent to backend
@freezed
abstract class LocationUpdate with _$LocationUpdate {
  const factory LocationUpdate({
    required double latitude,
    required double longitude,
    double? accuracy,
    double? altitude,
    double? speed,
    double? heading,
    required String timestamp,
    @JsonKey(name: 'battery_level') int? batteryLevel,
  }) = _LocationUpdate;

  factory LocationUpdate.fromJson(Map<String, dynamic> json) =>
      _$LocationUpdateFromJson(json);
}

/// Response from location update endpoint
@freezed
abstract class LocationUpdateResponse with _$LocationUpdateResponse {
  const factory LocationUpdateResponse({
    required bool success,
    String? message,
    @JsonKey(name: 'last_updated') String? lastUpdated,
  }) = _LocationUpdateResponse;

  factory LocationUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationUpdateResponseFromJson(json);
}

/// Current location response
@freezed
abstract class CurrentLocationResponse with _$CurrentLocationResponse {
  const factory CurrentLocationResponse({
    @JsonKey(name: 'postman_id') required String postmanId,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'last_updated') required String lastUpdated,
    @JsonKey(name: 'is_on_duty') required bool isOnDuty,
  }) = _CurrentLocationResponse;

  factory CurrentLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentLocationResponseFromJson(json);
}

/// WebSocket message types
enum LocationMessageType {
  @JsonValue('location_update')
  locationUpdate,
  @JsonValue('ping')
  ping,
  @JsonValue('pong')
  pong,
  @JsonValue('ack')
  ack,
  @JsonValue('error')
  error,
}

/// WebSocket message wrapper
@freezed
abstract class LocationMessage with _$LocationMessage {
  const factory LocationMessage({
    required LocationMessageType type,
    LocationUpdate? data,
    String? message,
  }) = _LocationMessage;

  factory LocationMessage.fromJson(Map<String, dynamic> json) =>
      _$LocationMessageFromJson(json);
}
