import 'dart:io';
import 'dart:typed_data';

import 'package:postman/core/providers/core_providers.dart';
import 'package:postman/features/pod/model/pod_models.dart';
import 'package:postman/features/pod/repository/pod_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pod_provider.g.dart';

/// Provides the PodRepository instance
@riverpod
PodRepository podRepository(PodRepositoryRef ref) {
  return PodRepositoryImpl(apiClient: ref.watch(apiClientProvider));
}

/// State for POD capture flow
class PodState {
  final String parcelId;
  final String trackingNumber;
  final bool isLoading;
  final String? errorMessage;

  // Captured data
  final File? photoFile;
  final String? photoUrl;
  final Uint8List? signatureBytes;
  final String? signatureUrl;
  final bool otpVerified;
  final String? receivedByName;
  final String? receivedByRelation;
  final String? deliveryNotes;

  // COD state
  final bool isCodParcel;
  final double? codAmount;
  final bool codCollected;

  // OTP state
  final bool otpSent;
  final int? otpExpiresIn;

  // Individual loading states
  final bool isUploadingPhoto;
  final bool isUploadingSignature;
  final bool isGeneratingOtp;
  final bool isVerifyingOtp;
  final bool isSubmitting;

  // Submission state
  final bool isSubmitted;
  final SubmitPodResponse? submitResponse;

  const PodState({
    required this.parcelId,
    required this.trackingNumber,
    this.isLoading = false,
    this.errorMessage,
    this.photoFile,
    this.photoUrl,
    this.signatureBytes,
    this.signatureUrl,
    this.otpVerified = false,
    this.receivedByName,
    this.receivedByRelation,
    this.deliveryNotes,
    this.isCodParcel = false,
    this.codAmount,
    this.codCollected = false,
    this.otpSent = false,
    this.otpExpiresIn,
    this.isUploadingPhoto = false,
    this.isUploadingSignature = false,
    this.isGeneratingOtp = false,
    this.isVerifyingOtp = false,
    this.isSubmitting = false,
    this.isSubmitted = false,
    this.submitResponse,
  });

  /// Helper to check if OTP was generated
  bool get otpGenerated => otpSent;

  PodState copyWith({
    String? parcelId,
    String? trackingNumber,
    bool? isLoading,
    String? errorMessage,
    File? photoFile,
    bool clearPhoto = false,
    String? photoUrl,
    Uint8List? signatureBytes,
    bool clearSignature = false,
    String? signatureUrl,
    bool? otpVerified,
    String? receivedByName,
    String? receivedByRelation,
    String? deliveryNotes,
    bool? isCodParcel,
    double? codAmount,
    bool? codCollected,
    bool? otpSent,
    int? otpExpiresIn,
    bool? isUploadingPhoto,
    bool? isUploadingSignature,
    bool? isGeneratingOtp,
    bool? isVerifyingOtp,
    bool? isSubmitting,
    bool? isSubmitted,
    SubmitPodResponse? submitResponse,
  }) {
    return PodState(
      parcelId: parcelId ?? this.parcelId,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      photoFile: clearPhoto ? null : (photoFile ?? this.photoFile),
      photoUrl: photoUrl ?? this.photoUrl,
      signatureBytes: clearSignature
          ? null
          : (signatureBytes ?? this.signatureBytes),
      signatureUrl: signatureUrl ?? this.signatureUrl,
      otpVerified: otpVerified ?? this.otpVerified,
      receivedByName: receivedByName ?? this.receivedByName,
      receivedByRelation: receivedByRelation ?? this.receivedByRelation,
      deliveryNotes: deliveryNotes ?? this.deliveryNotes,
      isCodParcel: isCodParcel ?? this.isCodParcel,
      codAmount: codAmount ?? this.codAmount,
      codCollected: codCollected ?? this.codCollected,
      otpSent: otpSent ?? this.otpSent,
      otpExpiresIn: otpExpiresIn ?? this.otpExpiresIn,
      isUploadingPhoto: isUploadingPhoto ?? this.isUploadingPhoto,
      isUploadingSignature: isUploadingSignature ?? this.isUploadingSignature,
      isGeneratingOtp: isGeneratingOtp ?? this.isGeneratingOtp,
      isVerifyingOtp: isVerifyingOtp ?? this.isVerifyingOtp,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      submitResponse: submitResponse ?? this.submitResponse,
    );
  }

  /// Check if we have any proof collected
  bool get hasProof => photoUrl != null || signatureUrl != null || otpVerified;

  /// Check if COD requirement is met
  bool get isCodRequirementMet => !isCodParcel || codCollected;

  /// Check if we're ready to submit
  bool get canSubmit =>
      hasProof && isCodRequirementMet && !isLoading && !isSubmitted;
}

/// Notifier for POD capture flow
@riverpod
class PodNotifier extends _$PodNotifier {
  PodRepository get _repository => ref.read(podRepositoryProvider);

  @override
  PodState build(String parcelId, String trackingNumber) {
    return PodState(parcelId: parcelId, trackingNumber: trackingNumber);
  }

  /// Initialize COD info for the parcel
  void initializeCodInfo({required bool isCod, double? codAmount}) {
    state = state.copyWith(isCodParcel: isCod, codAmount: codAmount);
  }

  /// Set COD collected status
  void setCodCollected(bool collected) {
    state = state.copyWith(codCollected: collected);
  }

  /// Set photo file (captured from camera), null to clear
  void setPhoto(File? file) {
    if (file == null) {
      state = state.copyWith(clearPhoto: true);
    } else {
      state = state.copyWith(photoFile: file);
    }
  }

  /// Set signature bytes (captured from signature pad), null to clear
  void setSignature(Uint8List? bytes) {
    if (bytes == null) {
      state = state.copyWith(clearSignature: true);
    } else {
      state = state.copyWith(signatureBytes: bytes);
    }
  }

  /// Set received by name
  void setReceivedByName(String name) {
    state = state.copyWith(receivedByName: name);
  }

  /// Set received by relation
  void setReceivedByRelation(String relation) {
    state = state.copyWith(receivedByRelation: relation);
  }

  /// Set delivery notes
  void setDeliveryNotes(String notes) {
    state = state.copyWith(deliveryNotes: notes);
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  /// Generate OTP for verification
  Future<bool> generateOtp({String? recipientPhone}) async {
    state = state.copyWith(isGeneratingOtp: true, errorMessage: null);

    final result = await _repository.generateOtp(
      parcelId: state.parcelId,
      recipientPhone: recipientPhone,
    );

    return result.match(
      (failure) {
        state = state.copyWith(
          isGeneratingOtp: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (response) {
        state = state.copyWith(
          isGeneratingOtp: false,
          otpSent: response.otpSent,
          otpExpiresIn: response.expiresIn,
        );
        return response.otpSent;
      },
    );
  }

  /// Verify OTP
  Future<bool> verifyOtp(String otp) async {
    state = state.copyWith(isVerifyingOtp: true, errorMessage: null);

    final result = await _repository.verifyOtp(
      parcelId: state.parcelId,
      otp: otp,
    );

    return result.match(
      (failure) {
        state = state.copyWith(
          isVerifyingOtp: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (response) {
        state = state.copyWith(
          isVerifyingOtp: false,
          otpVerified: response.verified,
        );
        return response.verified;
      },
    );
  }

  /// Upload photo to server
  Future<bool> uploadPhoto() async {
    if (state.photoFile == null) return false;

    state = state.copyWith(isUploadingPhoto: true, errorMessage: null);

    final result = await _repository.uploadPhoto(
      parcelId: state.parcelId,
      imageFile: state.photoFile!,
    );

    return result.match(
      (failure) {
        state = state.copyWith(
          isUploadingPhoto: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (response) {
        state = state.copyWith(isUploadingPhoto: false, photoUrl: response.url);
        return true;
      },
    );
  }

  /// Upload signature to server
  Future<bool> uploadSignature() async {
    if (state.signatureBytes == null) return false;

    state = state.copyWith(isUploadingSignature: true, errorMessage: null);

    final result = await _repository.uploadSignature(
      parcelId: state.parcelId,
      signatureBytes: state.signatureBytes!,
    );

    return result.match(
      (failure) {
        state = state.copyWith(
          isUploadingSignature: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (response) {
        state = state.copyWith(
          isUploadingSignature: false,
          signatureUrl: response.url,
        );
        return true;
      },
    );
  }

  /// Submit proof of delivery
  Future<bool> submitProof({double? lat, double? lng}) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);

    // Upload photo if not already uploaded
    if (state.photoFile != null && state.photoUrl == null) {
      final uploaded = await uploadPhoto();
      if (!uploaded) {
        state = state.copyWith(isSubmitting: false);
        return false;
      }
    }

    // Upload signature if not already uploaded
    if (state.signatureBytes != null && state.signatureUrl == null) {
      final uploaded = await uploadSignature();
      if (!uploaded) {
        state = state.copyWith(isSubmitting: false);
        return false;
      }
    }

    // Submit the proof
    final result = await _repository.submitProof(
      parcelId: state.parcelId,
      photoUrl: state.photoUrl,
      signatureUrl: state.signatureUrl,
      otpVerified: state.otpVerified,
      receivedByName: state.receivedByName ?? 'Unknown',
      receivedByRelation: state.receivedByRelation ?? 'Self',
      deliveryNotes: state.deliveryNotes,
      // Backend expects a boolean; never send null.
      codCollected: state.isCodParcel ? state.codCollected : false,
      // Backend expects cod_amount_received when COD is collected.
      codAmountReceived: (state.isCodParcel && state.codCollected)
          ? state.codAmount
          : null,
      lat: lat,
      lng: lng,
    );

    return result.match(
      (failure) {
        state = state.copyWith(
          isSubmitting: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (response) {
        state = state.copyWith(
          isSubmitting: false,
          isSubmitted: true,
          submitResponse: response,
        );
        return true;
      },
    );
  }
}
