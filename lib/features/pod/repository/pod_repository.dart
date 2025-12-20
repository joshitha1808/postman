import 'dart:io';
import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:postman/core/constants/api_endpoints.dart';
import 'package:postman/core/error/failure.dart';
import 'package:postman/core/network/api_client.dart';
import 'package:postman/features/pod/model/pod_models.dart';

/// Repository for Proof of Delivery operations
abstract class PodRepository {
  /// Generate OTP for delivery verification
  Future<Either<Failure, GenerateOtpResponse>> generateOtp({
    required String parcelId,
    String? recipientPhone,
  });

  /// Verify OTP
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required String parcelId,
    required String otp,
  });

  /// Upload POD photo
  Future<Either<Failure, UploadResponse>> uploadPhoto({
    required String parcelId,
    required File imageFile,
  });

  /// Upload signature
  Future<Either<Failure, UploadResponse>> uploadSignature({
    required String parcelId,
    required Uint8List signatureBytes,
  });

  /// Submit proof of delivery
  Future<Either<Failure, SubmitPodResponse>> submitProof({
    required String parcelId,
    String? photoUrl,
    String? signatureUrl,
    bool otpVerified = false,
    required String receivedByName,
    required String receivedByRelation,
    String? deliveryNotes,
    bool codCollected = false,
    double? codAmountReceived,
    double? lat,
    double? lng,
  });
}

/// Implementation of POD repository
class PodRepositoryImpl implements PodRepository {
  final ApiClient _apiClient;

  PodRepositoryImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<Either<Failure, GenerateOtpResponse>> generateOtp({
    required String parcelId,
    String? recipientPhone,
  }) async {
    return _apiClient.post<GenerateOtpResponse>(
      ApiEndpoints.generateOtp(parcelId),
      body: GenerateOtpRequest(recipientPhone: recipientPhone).toJson(),
      fromJson: GenerateOtpResponse.fromJson,
    );
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required String parcelId,
    required String otp,
  }) async {
    return _apiClient.post<VerifyOtpResponse>(
      ApiEndpoints.verifyOtp(parcelId),
      body: VerifyOtpRequest(otp: otp).toJson(),
      fromJson: VerifyOtpResponse.fromJson,
    );
  }

  @override
  Future<Either<Failure, UploadResponse>> uploadPhoto({
    required String parcelId,
    required File imageFile,
  }) async {
    return _apiClient.postMultipart<UploadResponse>(
      ApiEndpoints.uploadPodPhoto,
      file: imageFile,
      fileField: 'file',
      fields: {'parcel_id': parcelId},
      fromJson: UploadResponse.fromJson,
    );
  }

  @override
  Future<Either<Failure, UploadResponse>> uploadSignature({
    required String parcelId,
    required Uint8List signatureBytes,
  }) async {
    return _apiClient.postMultipartBytes<UploadResponse>(
      ApiEndpoints.uploadSignature,
      bytes: signatureBytes,
      filename: 'signature_$parcelId.png',
      fileField: 'file',
      contentType: 'image/png',
      fields: {'parcel_id': parcelId},
      fromJson: UploadResponse.fromJson,
    );
  }

  @override
  Future<Either<Failure, SubmitPodResponse>> submitProof({
    required String parcelId,
    String? photoUrl,
    String? signatureUrl,
    bool otpVerified = false,
    required String receivedByName,
    required String receivedByRelation,
    String? deliveryNotes,
    bool codCollected = false,
    double? codAmountReceived,
    double? lat,
    double? lng,
  }) async {
    final request = SubmitPodRequest(
      photoUrl: photoUrl,
      signatureUrl: signatureUrl,
      otpVerified: otpVerified,
      receivedByName: receivedByName,
      receivedByRelation: receivedByRelation,
      deliveryNotes: deliveryNotes,
      codCollected: codCollected,
      codAmountReceived: codAmountReceived,
      lat: lat,
      lng: lng,
      clientTimestamp: DateTime.now().toUtc().toIso8601String(),
    );

    return _apiClient.post<SubmitPodResponse>(
      ApiEndpoints.submitProof(parcelId),
      body: request.toJson(),
      fromJson: SubmitPodResponse.fromJson,
    );
  }
}
