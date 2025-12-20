// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateOtpRequest _$GenerateOtpRequestFromJson(Map<String, dynamic> json) =>
    _GenerateOtpRequest(recipientPhone: json['recipient_phone'] as String?);

Map<String, dynamic> _$GenerateOtpRequestToJson(_GenerateOtpRequest instance) =>
    <String, dynamic>{'recipient_phone': instance.recipientPhone};

_GenerateOtpResponse _$GenerateOtpResponseFromJson(Map<String, dynamic> json) =>
    _GenerateOtpResponse(
      parcelId: json['parcel_id'] as String,
      otpSent: json['otp_sent'] as bool,
      expiresIn: (json['expires_in'] as num).toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GenerateOtpResponseToJson(
  _GenerateOtpResponse instance,
) => <String, dynamic>{
  'parcel_id': instance.parcelId,
  'otp_sent': instance.otpSent,
  'expires_in': instance.expiresIn,
  'message': instance.message,
};

_VerifyOtpRequest _$VerifyOtpRequestFromJson(Map<String, dynamic> json) =>
    _VerifyOtpRequest(otp: json['otp'] as String);

Map<String, dynamic> _$VerifyOtpRequestToJson(_VerifyOtpRequest instance) =>
    <String, dynamic>{'otp': instance.otp};

_VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    _VerifyOtpResponse(
      parcelId: json['parcel_id'] as String,
      verified: json['verified'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(_VerifyOtpResponse instance) =>
    <String, dynamic>{
      'parcel_id': instance.parcelId,
      'verified': instance.verified,
      'message': instance.message,
    };

_SubmitPodRequest _$SubmitPodRequestFromJson(Map<String, dynamic> json) =>
    _SubmitPodRequest(
      photoUrl: json['photo_url'] as String?,
      signatureUrl: json['signature_url'] as String?,
      otpVerified: json['otp_verified'] as bool? ?? false,
      receivedByName: json['received_by_name'] as String,
      receivedByRelation: json['received_by_relation'] as String,
      deliveryNotes: json['delivery_notes'] as String?,
      codCollected: json['cod_collected'] as bool? ?? false,
      codAmountReceived: (json['cod_amount_received'] as num?)?.toDouble(),
      codAmount: (json['cod_amount'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      clientTimestamp: json['client_timestamp'] as String?,
    );

Map<String, dynamic> _$SubmitPodRequestToJson(_SubmitPodRequest instance) =>
    <String, dynamic>{
      'photo_url': instance.photoUrl,
      'signature_url': instance.signatureUrl,
      'otp_verified': instance.otpVerified,
      'received_by_name': instance.receivedByName,
      'received_by_relation': instance.receivedByRelation,
      'delivery_notes': instance.deliveryNotes,
      'cod_collected': instance.codCollected,
      if (instance.codAmountReceived case final value?)
        'cod_amount_received': value,
      if (instance.codAmount case final value?) 'cod_amount': value,
      'lat': instance.lat,
      'lng': instance.lng,
      'client_timestamp': instance.clientTimestamp,
    };

_SubmitPodResponse _$SubmitPodResponseFromJson(Map<String, dynamic> json) =>
    _SubmitPodResponse(
      parcelId: json['parcel_id'] as String,
      trackingNumber: json['tracking_number'] as String,
      otpVerified: json['otp_verified'] as bool? ?? false,
      hasPhoto: json['has_photo'] as bool? ?? false,
      hasSignature: json['has_signature'] as bool? ?? false,
      receivedByName: json['received_by_name'] as String?,
      receivedByRelation: json['received_by_relation'] as String?,
      submittedAt: json['submitted_at'] as String?,
      status: json['status'] as String?,
      deliveredAt: json['delivered_at'] as String?,
      proofRecorded: json['proof_recorded'] as bool?,
    );

Map<String, dynamic> _$SubmitPodResponseToJson(_SubmitPodResponse instance) =>
    <String, dynamic>{
      'parcel_id': instance.parcelId,
      'tracking_number': instance.trackingNumber,
      'otp_verified': instance.otpVerified,
      'has_photo': instance.hasPhoto,
      'has_signature': instance.hasSignature,
      'received_by_name': instance.receivedByName,
      'received_by_relation': instance.receivedByRelation,
      'submitted_at': instance.submittedAt,
      'status': instance.status,
      'delivered_at': instance.deliveredAt,
      'proof_recorded': instance.proofRecorded,
    };

_UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) =>
    _UploadResponse(
      photoUrl: json['photo_url'] as String?,
      photoPath: json['photo_path'] as String?,
      signaturePath: json['signature_path'] as String?,
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$UploadResponseToJson(_UploadResponse instance) =>
    <String, dynamic>{
      'photo_url': instance.photoUrl,
      'photo_path': instance.photoPath,
      'signature_path': instance.signaturePath,
      'success': instance.success,
    };
