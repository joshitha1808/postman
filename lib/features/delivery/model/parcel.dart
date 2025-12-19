import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart';

part 'parcel.freezed.dart';
part 'parcel.g.dart';

/// Represents a parcel/delivery item
@freezed
abstract class Parcel with _$Parcel {
  const Parcel._();

  const factory Parcel({
    required String id,
    @JsonKey(name: 'tracking_number') required String trackingNumber,
    @JsonKey(name: 'recipient_name') required String recipientName,
    @JsonKey(name: 'recipient_phone') String? recipientPhone,
    @JsonKey(name: 'recipient_address') required String recipientAddress,
    @JsonKey(name: 'recipient_pincode') required String recipientPincode,
    @JsonKey(name: 'status', fromJson: _statusFromJson, toJson: _statusToJson)
    required DeliveryStatus status,
    @JsonKey(
      name: 'priority',
      fromJson: _priorityFromJson,
      toJson: _priorityToJson,
    )
    @Default(DeliveryPriority.normal)
    DeliveryPriority priority,
    @JsonKey(name: 'delivery_sequence') int? deliverySequence,
    @JsonKey(name: 'parcel_type') String? parcelType,
    @JsonKey(name: 'is_cod') @Default(false) bool isCod,
    @JsonKey(name: 'cod_amount') @Default(0.0) double codAmount,
    @JsonKey(name: 'weight_grams') @Default(0) int weightGrams,
    @JsonKey(name: 'has_customer_pin') @Default(false) bool hasCustomerPin,
    @JsonKey(name: 'delivery_lat') double? deliveryLat,
    @JsonKey(name: 'delivery_lng') double? deliveryLng,
  }) = _Parcel;

  factory Parcel.fromJson(Map<String, dynamic> json) => _$ParcelFromJson(json);

  /// Check if parcel has valid coordinates for navigation
  bool get hasValidCoordinates => deliveryLat != null && deliveryLng != null;

  /// Get formatted weight string
  String get formattedWeight {
    if (weightGrams >= 1000) {
      return '${(weightGrams / 1000).toStringAsFixed(1)} kg';
    }
    return '$weightGrams g';
  }

  /// Get formatted COD amount
  String get formattedCodAmount => '₹${codAmount.toStringAsFixed(0)}';
}

// Helper functions for JSON conversion
DeliveryStatus _statusFromJson(String value) =>
    DeliveryStatus.fromString(value);
String _statusToJson(DeliveryStatus status) => status.value;

DeliveryPriority _priorityFromJson(String value) =>
    DeliveryPriority.fromString(value);
String _priorityToJson(DeliveryPriority priority) => priority.value;
