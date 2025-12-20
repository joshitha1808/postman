import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../viewmodel/pod_provider.dart';
import '../widgets/signature_pad.dart';

class PodCapturePage extends ConsumerStatefulWidget {
  const PodCapturePage({
    super.key,
    required this.parcelId,
    required this.trackingNumber,
    required this.recipientName,
    this.isCod = false,
    this.codAmount,
  });

  final String parcelId;
  final String trackingNumber;
  final String recipientName;
  final bool isCod;
  final double? codAmount;

  @override
  ConsumerState<PodCapturePage> createState() => _PodCapturePageState();
}

enum _PodProofMethod { photo, signature, otp }

class _PodCapturePageState extends ConsumerState<PodCapturePage> {
  final _otpController = TextEditingController();
  final _receiverNameController = TextEditingController();
  final _signaturePadKey = GlobalKey<SignaturePadState>();
  final _imagePicker = ImagePicker();
  String _selectedRelation = 'SELF';
  int _currentStep = 0;
  _PodProofMethod _selectedProofMethod = _PodProofMethod.photo;

  bool get _isCodParcel => widget.isCod || (widget.codAmount ?? 0) > 0;

  @override
  void initState() {
    super.initState();
    // Pre-fill receiver name with recipient name
    _receiverNameController.text = widget.recipientName;
    // Initialize COD info after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isCodParcel) {
        ref
            .read(
              podNotifierProvider(
                widget.parcelId,
                widget.trackingNumber,
              ).notifier,
            )
            .initializeCodInfo(
              isCod: _isCodParcel,
              codAmount: widget.codAmount,
            );
      }
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _receiverNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final podState = ref.watch(
      podNotifierProvider(widget.parcelId, widget.trackingNumber),
    );
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Proof of Delivery')),
      body: Stepper(
        currentStep: _currentStep,
        type: StepperType.vertical,
        onStepTapped: (index) {
          if (index <= _currentStep) {
            setState(() => _currentStep = index);
          }
        },
        controlsBuilder: (context, details) {
          final canGoNext = _canGoNext(podState);
          final isLast = _currentStep == 2;

          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: (!isLast && canGoNext)
                        ? () => _goNext(podState)
                        : (isLast &&
                              _canSubmit(podState) &&
                              !podState.isSubmitting)
                        ? () => _submitProof()
                        : null,
                    icon: podState.isSubmitting && isLast
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Icon(
                            isLast
                                ? Iconsax.tick_circle
                                : Iconsax.arrow_right_3,
                          ),
                    label: Text(
                      isLast
                          ? (podState.isSubmitting
                                ? 'Submitting...'
                                : 'Complete Delivery')
                          : 'Next',
                    ),
                  ),
                ),
                if (_currentStep > 0) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: podState.isSubmitting
                          ? null
                          : () => setState(() => _currentStep -= 1),
                      icon: const Icon(Iconsax.arrow_left_2),
                      label: const Text('Back'),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Receiver'),
            subtitle: Text(
              _isReceiverStepComplete(podState)
                  ? 'Receiver details captured'
                  : 'Enter receiver details',
            ),
            isActive: _currentStep >= 0,
            state: _isReceiverStepComplete(podState)
                ? StepState.complete
                : StepState.indexed,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildRecipientHeader(theme),
                const SizedBox(height: 16),
                _buildReceiverInfo(theme),
                if (_isCodParcel) ...[
                  const SizedBox(height: 16),
                  _buildCodSection(podState),
                ],
              ],
            ),
          ),
          Step(
            title: const Text('Proof'),
            subtitle: Text(_proofSubtitle(podState)),
            isActive: _currentStep >= 1,
            state: _isProofStepComplete(podState)
                ? StepState.complete
                : (_currentStep > 1 ? StepState.error : StepState.indexed),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildProofMethodPicker(theme),
                const SizedBox(height: 16),
                _buildSelectedProofContent(podState),
              ],
            ),
          ),
          Step(
            title: const Text('Confirm'),
            subtitle: const Text('Review and complete delivery'),
            isActive: _currentStep >= 2,
            state: _canSubmit(podState)
                ? StepState.complete
                : StepState.indexed,
            content: _buildConfirmStep(theme, podState),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipientHeader(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivering to',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.recipientName,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Tracking: ${widget.trackingNumber}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiverInfo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Received By',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _receiverNameController,
          decoration: InputDecoration(
            labelText: 'Receiver Name *',
            hintText: 'Name of person receiving',
            prefixIcon: const Icon(Iconsax.user),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: _selectedRelation,
          decoration: InputDecoration(
            labelText: 'Relation to Recipient *',
            prefixIcon: const Icon(Iconsax.people),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          items: const [
            DropdownMenuItem(value: 'SELF', child: Text('Self')),
            DropdownMenuItem(value: 'FAMILY', child: Text('Family Member')),
            DropdownMenuItem(value: 'Friend', child: Text('Friend')),
            DropdownMenuItem(value: 'NEIGHBOR', child: Text('Neighbor')),
            DropdownMenuItem(value: 'SECURITY', child: Text('Security Guard')),
            DropdownMenuItem(
              value: 'OFFICE_STAFF',
              child: Text('Receptionist'),
            ),
            DropdownMenuItem(value: 'OTHER', child: Text('Other')),
          ],
          onChanged: (value) {
            setState(() {
              _selectedRelation = value ?? 'SELF';
            });
          },
        ),
      ],
    );
  }

  Widget _buildProofMethodPicker(ThemeData theme) {
    return DropdownButtonFormField<_PodProofMethod>(
      value: _selectedProofMethod,
      decoration: InputDecoration(
        prefixIcon: const Icon(Iconsax.verify),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: _PodProofMethod.photo,
          child: Text('Photo (upload required)'),
        ),
        DropdownMenuItem(
          value: _PodProofMethod.signature,
          child: Text('Signature (upload required)'),
        ),
        DropdownMenuItem(
          value: _PodProofMethod.otp,
          child: Text('OTP (verification required)'),
        ),
      ],
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          _selectedProofMethod = value;
        });
      },
    );
  }

  Widget _buildSelectedProofContent(PodState state) {
    switch (_selectedProofMethod) {
      case _PodProofMethod.photo:
        return _buildPhotoContent(state);
      case _PodProofMethod.signature:
        return _buildSignatureContent(state);
      case _PodProofMethod.otp:
        return _buildOtpContent(state);
    }
  }

  Widget _buildConfirmStep(ThemeData theme, PodState state) {
    final receiverName = _receiverNameController.text.trim();
    final relation = _selectedRelation;
    final proofStatus = _proofSubtitle(state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Summary',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text('Receiver: ${receiverName.isEmpty ? '—' : receiverName}'),
              Text('Relation: $relation'),
              Text('Proof: $proofStatus'),
              if (_isCodParcel)
                Text(
                  'COD: ${state.codCollected ? 'Collected' : 'Not collected'}',
                ),
            ],
          ),
        ),
        if (!_canSubmit(state)) ...[
          const SizedBox(height: 12),
          Text(
            'Complete the required steps to submit.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  bool _isReceiverStepComplete(PodState state) {
    final hasReceiverInfo = _receiverNameController.text.trim().isNotEmpty;
    final codRequirementMet = !_isCodParcel || state.codCollected;
    return hasReceiverInfo && codRequirementMet;
  }

  bool _isProofStepComplete(PodState state) {
    switch (_selectedProofMethod) {
      case _PodProofMethod.photo:
        return state.photoUrl != null;
      case _PodProofMethod.signature:
        return state.signatureUrl != null;
      case _PodProofMethod.otp:
        return state.otpVerified;
    }
  }

  bool _canGoNext(PodState state) {
    if (_currentStep == 0) return _isReceiverStepComplete(state);
    if (_currentStep == 1) return _isProofStepComplete(state);
    return false;
  }

  void _goNext(PodState state) {
    if (!_canGoNext(state)) return;
    if (!mounted) return;
    setState(() {
      _currentStep = (_currentStep + 1).clamp(0, 2);
    });
  }

  String _proofSubtitle(PodState state) {
    switch (_selectedProofMethod) {
      case _PodProofMethod.photo:
        return state.photoUrl != null ? 'Photo uploaded' : 'Upload a photo';
      case _PodProofMethod.signature:
        return state.signatureUrl != null
            ? 'Signature uploaded'
            : 'Capture and upload signature';
      case _PodProofMethod.otp:
        return state.otpVerified
            ? 'OTP verified'
            : (state.otpGenerated ? 'Verify OTP' : 'Send OTP');
    }
  }

  Widget _buildPhotoContent(PodState state) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Take a photo of the delivered package',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: state.photoFile != null
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(state.photoFile!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton.filled(
                        onPressed: () {
                          ref
                              .read(
                                podNotifierProvider(
                                  widget.parcelId,
                                  widget.trackingNumber,
                                ).notifier,
                              )
                              .setPhoto(null);
                        },
                        icon: const Icon(Iconsax.close_circle),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                    if (state.photoUrl != null)
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check, color: Colors.white, size: 16),
                              SizedBox(width: 4),
                              Text(
                                'Uploaded',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.camera,
                      size: 64,
                      color: theme.colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No photo captured',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: state.isUploadingPhoto
                    ? null
                    : () => _pickPhoto(ImageSource.gallery),
                icon: const Icon(Iconsax.gallery),
                label: const Text('Gallery'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: state.isUploadingPhoto
                    ? null
                    : () => _pickPhoto(ImageSource.camera),
                icon: const Icon(Iconsax.camera),
                label: const Text('Camera'),
              ),
            ),
          ],
        ),
        if (state.photoFile != null && state.photoUrl == null) ...[
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: state.isUploadingPhoto ? null : _uploadPhoto,
            icon: state.isUploadingPhoto
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Iconsax.cloud_add),
            label: Text(
              state.isUploadingPhoto ? 'Uploading...' : 'Upload Photo',
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSignatureContent(PodState state) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Get recipient signature',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SignaturePad(
                  key: _signaturePadKey,
                  backgroundColor: theme.colorScheme.surface,
                  strokeColor: theme.colorScheme.onSurface,
                ),
              ),
              if (state.signatureUrl != null)
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Uploaded',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  _signaturePadKey.currentState?.clear();
                  ref
                      .read(
                        podNotifierProvider(
                          widget.parcelId,
                          widget.trackingNumber,
                        ).notifier,
                      )
                      .setSignature(null);
                },
                icon: const Icon(Iconsax.refresh),
                label: const Text('Clear'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: state.isUploadingSignature ? null : _uploadSignature,
                icon: state.isUploadingSignature
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Iconsax.cloud_add),
                label: Text(
                  state.isUploadingSignature
                      ? 'Uploading...'
                      : 'Save Signature',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOtpContent(PodState state) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Verify delivery with OTP',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Iconsax.shield_tick,
            size: 64,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        if (!state.otpGenerated) ...[
          FilledButton.icon(
            onPressed: state.isGeneratingOtp ? null : _generateOtp,
            icon: state.isGeneratingOtp
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Iconsax.sms),
            label: Text(
              state.isGeneratingOtp
                  ? 'Sending OTP...'
                  : 'Send OTP to Recipient',
            ),
          ),
        ] else ...[
          Text(
            'Enter the OTP received by recipient',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _otpController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 6,
            style: theme.textTheme.headlineMedium?.copyWith(
              letterSpacing: 8,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: '000000',
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
            ),
          ),
          const SizedBox(height: 12),
          if (state.otpVerified)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.tick_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text(
                    'OTP Verified Successfully',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          else
            FilledButton.icon(
              onPressed: state.isVerifyingOtp ? null : _verifyOtp,
              icon: state.isVerifyingOtp
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Iconsax.tick_circle),
              label: Text(state.isVerifyingOtp ? 'Verifying...' : 'Verify OTP'),
            ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: state.isGeneratingOtp ? null : _generateOtp,
            icon: const Icon(Iconsax.refresh),
            label: const Text('Resend OTP'),
          ),
        ],
      ],
    );
  }

  bool _canSubmit(PodState state) {
    // At least one proof method should be completed
    final hasProof =
        state.photoUrl != null ||
        state.signatureUrl != null ||
        state.otpVerified;
    // Receiver name is required
    final hasReceiverInfo = _receiverNameController.text.trim().isNotEmpty;
    // COD must be collected for COD parcels
    final codRequirementMet = !_isCodParcel || state.codCollected;
    return hasProof && hasReceiverInfo && codRequirementMet;
  }

  Widget _buildCodSection(PodState state) {
    final theme = Theme.of(context);
    final codAmount = widget.codAmount ?? 0.0;
    final formattedAmount = '₹${codAmount.toStringAsFixed(2)}';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: state.codCollected
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: state.codCollected ? Colors.green : Colors.orange,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Iconsax.money_recive,
                color: state.codCollected ? Colors.green : Colors.orange,
              ),
              const SizedBox(width: 8),
              Text(
                'Cash on Delivery',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: state.codCollected ? Colors.green : Colors.orange,
                ),
              ),
              const Spacer(),
              Text(
                formattedAmount,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: state.codCollected ? Colors.green : Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CheckboxListTile(
            value: state.codCollected,
            onChanged: (value) {
              ref
                  .read(
                    podNotifierProvider(
                      widget.parcelId,
                      widget.trackingNumber,
                    ).notifier,
                  )
                  .setCodCollected(value ?? false);
            },
            title: Text(
              'I confirm that I have collected $formattedAmount from the recipient',
              style: theme.textTheme.bodyMedium,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: Colors.green,
          ),
          if (!state.codCollected)
            Text(
              '* COD collection is required to complete this delivery',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.orange.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickPhoto(ImageSource source) async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        ref
            .read(
              podNotifierProvider(
                widget.parcelId,
                widget.trackingNumber,
              ).notifier,
            )
            .setPhoto(file);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
      }
    }
  }

  Future<void> _uploadPhoto() async {
    final notifier = ref.read(
      podNotifierProvider(widget.parcelId, widget.trackingNumber).notifier,
    );

    final success = await notifier.uploadPhoto();
    if (mounted && !success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to upload photo')));
    }
  }

  Future<void> _uploadSignature() async {
    final signatureBytes = await _signaturePadKey.currentState?.toImage();
    if (signatureBytes == null || signatureBytes.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please draw a signature first')),
        );
      }
      return;
    }

    final notifier = ref.read(
      podNotifierProvider(widget.parcelId, widget.trackingNumber).notifier,
    );

    notifier.setSignature(signatureBytes);
    final success = await notifier.uploadSignature();
    if (mounted && !success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload signature')),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signature saved successfully')),
      );
    }
  }

  Future<void> _generateOtp() async {
    final notifier = ref.read(
      podNotifierProvider(widget.parcelId, widget.trackingNumber).notifier,
    );

    final success = await notifier.generateOtp();
    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('OTP sent to recipient')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to send OTP')));
      }
    }
  }

  Future<void> _verifyOtp() async {
    final otp = _otpController.text.trim();
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
      );
      return;
    }

    final notifier = ref.read(
      podNotifierProvider(widget.parcelId, widget.trackingNumber).notifier,
    );

    final success = await notifier.verifyOtp(otp);
    if (mounted) {
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    }
  }

  Future<void> _submitProof() async {
    final notifier = ref.read(
      podNotifierProvider(widget.parcelId, widget.trackingNumber).notifier,
    );

    // Set receiver info before submitting
    notifier.setReceivedByName(_receiverNameController.text.trim());
    notifier.setReceivedByRelation(_selectedRelation);

    final success = await notifier.submitProof();
    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Delivery confirmed successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true); // Return success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to submit proof of delivery')),
        );
      }
    }
  }
}
