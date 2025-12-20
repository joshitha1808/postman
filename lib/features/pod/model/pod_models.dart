import 'package:freezed_annotation/freezed_annotation.dart';

part 'pod_models.freezed.dart';
part 'pod_models.g.dart';

/// Request to generate OTP for delivery verification
@freezed
abstract class GenerateOtpRequest with _$GenerateOtpRequest {
  const factory GenerateOtpRequest({
    @JsonKey(name: 'recipient_phone') String? recipientPhone,
  }) = _GenerateOtpRequest;

  factory GenerateOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateOtpRequestFromJson(json);
}

/// Response from OTP generation
@freezed
abstract class GenerateOtpResponse with _$GenerateOtpResponse {
  const factory GenerateOtpResponse({
    @JsonKey(name: 'parcel_id') required String parcelId,
    @JsonKey(name: 'otp_sent') required bool otpSent,
    @JsonKey(name: 'expires_in') required int expiresIn,
    String? message,
  }) = _GenerateOtpResponse;

  factory GenerateOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateOtpResponseFromJson(json);
}

/// Request to verify OTP
@freezed
abstract class VerifyOtpRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({required String otp}) = _VerifyOtpRequest;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestFromJson(json);
}

/// Response from OTP verification
@freezed
abstract class VerifyOtpResponse with _$VerifyOtpResponse {
  const factory VerifyOtpResponse({
    @JsonKey(name: 'parcel_id') required String parcelId,
    required bool verified,
    String? message,
  }) = _VerifyOtpResponse;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);
}

/// Request to submit proof of delivery
@freezed
abstract class SubmitPodRequest with _$SubmitPodRequest {
  const factory SubmitPodRequest({
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'signature_url') String? signatureUrl,
    @JsonKey(name: 'otp_verified') @Default(false) bool otpVerified,
    @JsonKey(name: 'received_by_name') required String receivedByName,
    @JsonKey(name: 'received_by_relation') required String receivedByRelation,
    @JsonKey(name: 'delivery_notes') String? deliveryNotes,
    @JsonKey(name: 'cod_collected') @Default(false) bool codCollected,
    // Expected by backend for COD proof submission.
    @JsonKey(name: 'cod_amount_received', includeIfNull: false)
    double? codAmountReceived,
    // Kept for backwards compatibility; backend may ignore this.
    @JsonKey(name: 'cod_amount', includeIfNull: false) double? codAmount,
    double? lat,
    double? lng,
    @JsonKey(name: 'client_timestamp') String? clientTimestamp,
  }) = _SubmitPodRequest;

  factory SubmitPodRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitPodRequestFromJson(json);
}

/// Response from POD submission
@freezed
abstract class SubmitPodResponse with _$SubmitPodResponse {
  const factory SubmitPodResponse({
    @JsonKey(name: 'parcel_id') required String parcelId,
    @JsonKey(name: 'tracking_number') required String trackingNumber,
    // Newer backend response fields
    @JsonKey(name: 'otp_verified') @Default(false) bool otpVerified,
    @JsonKey(name: 'has_photo') @Default(false) bool hasPhoto,
    @JsonKey(name: 'has_signature') @Default(false) bool hasSignature,
    @JsonKey(name: 'received_by_name') String? receivedByName,
    @JsonKey(name: 'received_by_relation') String? receivedByRelation,
    @JsonKey(name: 'submitted_at') String? submittedAt,

    // Older/alternate backend fields (kept optional for compatibility)
    String? status,
    @JsonKey(name: 'delivered_at') String? deliveredAt,
    @JsonKey(name: 'proof_recorded') bool? proofRecorded,
  }) = _SubmitPodResponse;

  factory SubmitPodResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitPodResponseFromJson(json);
}

/// Response from file upload
@freezed
abstract class UploadResponse with _$UploadResponse {
  const UploadResponse._();

  const factory UploadResponse({
    /// For photo upload - the URL to access the photo
    @JsonKey(name: 'photo_url') String? photoUrl,

    /// For photo upload - the file path
    @JsonKey(name: 'photo_path') String? photoPath,

    /// For signature upload - the file path
    @JsonKey(name: 'signature_path') String? signaturePath,

    /// Success indicator
    @Default(false) bool success,
  }) = _UploadResponse;

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);

  /// Get the URL/path of the uploaded file
  String? get url => photoUrl ?? signaturePath ?? photoPath;
}
