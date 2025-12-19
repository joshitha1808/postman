// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Parcel _$ParcelFromJson(Map<String, dynamic> json) => _Parcel(
  id: json['id'] as String,
  trackingNumber: json['tracking_number'] as String,
  recipientName: json['recipient_name'] as String,
  recipientPhone: json['recipient_phone'] as String?,
  recipientAddress: json['recipient_address'] as String,
  recipientPincode: json['recipient_pincode'] as String,
  status: _statusFromJson(json['status'] as String),
  priority: json['priority'] == null
      ? DeliveryPriority.normal
      : _priorityFromJson(json['priority'] as String),
  deliverySequence: (json['delivery_sequence'] as num?)?.toInt(),
  parcelType: json['parcel_type'] as String?,
  isCod: json['is_cod'] as bool? ?? false,
  codAmount: (json['cod_amount'] as num?)?.toDouble() ?? 0.0,
  weightGrams: (json['weight_grams'] as num?)?.toInt() ?? 0,
  hasCustomerPin: json['has_customer_pin'] as bool? ?? false,
  deliveryLat: (json['delivery_lat'] as num?)?.toDouble(),
  deliveryLng: (json['delivery_lng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ParcelToJson(_Parcel instance) => <String, dynamic>{
  'id': instance.id,
  'tracking_number': instance.trackingNumber,
  'recipient_name': instance.recipientName,
  'recipient_phone': instance.recipientPhone,
  'recipient_address': instance.recipientAddress,
  'recipient_pincode': instance.recipientPincode,
  'status': _statusToJson(instance.status),
  'priority': _priorityToJson(instance.priority),
  'delivery_sequence': instance.deliverySequence,
  'parcel_type': instance.parcelType,
  'is_cod': instance.isCod,
  'cod_amount': instance.codAmount,
  'weight_grams': instance.weightGrams,
  'has_customer_pin': instance.hasCustomerPin,
  'delivery_lat': instance.deliveryLat,
  'delivery_lng': instance.deliveryLng,
};
