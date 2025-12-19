import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart';

part 'status_update.freezed.dart';
part 'status_update.g.dart';

/// Request model for updating parcel status
@freezed
abstract class StatusUpdateRequest with _$StatusUpdateRequest {
  const factory StatusUpdateRequest({
    @JsonKey(name: 'new_status') required String newStatus,
    double? lat,
    double? lng,
    @JsonKey(name: 'failure_reason') String? failureReason,
    @JsonKey(name: 'failure_notes') String? failureNotes,
    @JsonKey(name: 'client_timestamp') String? clientTimestamp,
    @JsonKey(name: 'client_update_id') String? clientUpdateId,
  }) = _StatusUpdateRequest;

  factory StatusUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$StatusUpdateRequestFromJson(json);

  /// Create a status update for OUT_FOR_DELIVERY
  factory StatusUpdateRequest.outForDelivery({
    double? lat,
    double? lng,
    String? clientUpdateId,
  }) {
    return StatusUpdateRequest(
      newStatus: DeliveryStatus.outForDelivery.value,
      lat: lat,
      lng: lng,
      clientTimestamp: DateTime.now().toUtc().toIso8601String(),
      clientUpdateId: clientUpdateId,
    );
  }

  /// Create a status update for FAILED
  factory StatusUpdateRequest.failed({
    required FailureReason reason,
    String? notes,
    double? lat,
    double? lng,
    String? clientUpdateId,
  }) {
    return StatusUpdateRequest(
      newStatus: DeliveryStatus.failed.value,
      failureReason: reason.value,
      failureNotes: notes,
      lat: lat,
      lng: lng,
      clientTimestamp: DateTime.now().toUtc().toIso8601String(),
      clientUpdateId: clientUpdateId,
    );
  }
}

/// Response model for status update
@freezed
abstract class StatusUpdateResponse with _$StatusUpdateResponse {
  const factory StatusUpdateResponse({
    @JsonKey(name: 'parcel_id') required String parcelId,
    @JsonKey(name: 'tracking_number') required String trackingNumber,
    @JsonKey(name: 'previous_status') required String previousStatus,
    @JsonKey(name: 'new_status') required String newStatus,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'is_duplicate') @Default(false) bool isDuplicate,
  }) = _StatusUpdateResponse;

  factory StatusUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusUpdateResponseFromJson(json);
}
