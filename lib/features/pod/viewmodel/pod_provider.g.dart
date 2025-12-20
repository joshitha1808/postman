// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$podRepositoryHash() => r'ebc1deea5339eebc61469cded0f12543c022b84b';

/// Provides the PodRepository instance
///
/// Copied from [podRepository].
@ProviderFor(podRepository)
final podRepositoryProvider = AutoDisposeProvider<PodRepository>.internal(
  podRepository,
  name: r'podRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$podRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PodRepositoryRef = AutoDisposeProviderRef<PodRepository>;
String _$podNotifierHash() => r'997c595fbb75e2f95b6f3de41e1f9c4deac5906d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PodNotifier extends BuildlessAutoDisposeNotifier<PodState> {
  late final String parcelId;
  late final String trackingNumber;

  PodState build(String parcelId, String trackingNumber);
}

/// Notifier for POD capture flow
///
/// Copied from [PodNotifier].
@ProviderFor(PodNotifier)
const podNotifierProvider = PodNotifierFamily();

/// Notifier for POD capture flow
///
/// Copied from [PodNotifier].
class PodNotifierFamily extends Family<PodState> {
  /// Notifier for POD capture flow
  ///
  /// Copied from [PodNotifier].
  const PodNotifierFamily();

  /// Notifier for POD capture flow
  ///
  /// Copied from [PodNotifier].
  PodNotifierProvider call(String parcelId, String trackingNumber) {
    return PodNotifierProvider(parcelId, trackingNumber);
  }

  @override
  PodNotifierProvider getProviderOverride(
    covariant PodNotifierProvider provider,
  ) {
    return call(provider.parcelId, provider.trackingNumber);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'podNotifierProvider';
}

/// Notifier for POD capture flow
///
/// Copied from [PodNotifier].
class PodNotifierProvider
    extends AutoDisposeNotifierProviderImpl<PodNotifier, PodState> {
  /// Notifier for POD capture flow
  ///
  /// Copied from [PodNotifier].
  PodNotifierProvider(String parcelId, String trackingNumber)
    : this._internal(
        () => PodNotifier()
          ..parcelId = parcelId
          ..trackingNumber = trackingNumber,
        from: podNotifierProvider,
        name: r'podNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$podNotifierHash,
        dependencies: PodNotifierFamily._dependencies,
        allTransitiveDependencies: PodNotifierFamily._allTransitiveDependencies,
        parcelId: parcelId,
        trackingNumber: trackingNumber,
      );

  PodNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parcelId,
    required this.trackingNumber,
  }) : super.internal();

  final String parcelId;
  final String trackingNumber;

  @override
  PodState runNotifierBuild(covariant PodNotifier notifier) {
    return notifier.build(parcelId, trackingNumber);
  }

  @override
  Override overrideWith(PodNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PodNotifierProvider._internal(
        () => create()
          ..parcelId = parcelId
          ..trackingNumber = trackingNumber,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parcelId: parcelId,
        trackingNumber: trackingNumber,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PodNotifier, PodState> createElement() {
    return _PodNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PodNotifierProvider &&
        other.parcelId == parcelId &&
        other.trackingNumber == trackingNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parcelId.hashCode);
    hash = _SystemHash.combine(hash, trackingNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PodNotifierRef on AutoDisposeNotifierProviderRef<PodState> {
  /// The parameter `parcelId` of this provider.
  String get parcelId;

  /// The parameter `trackingNumber` of this provider.
  String get trackingNumber;
}

class _PodNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<PodNotifier, PodState>
    with PodNotifierRef {
  _PodNotifierProviderElement(super.provider);

  @override
  String get parcelId => (origin as PodNotifierProvider).parcelId;
  @override
  String get trackingNumber => (origin as PodNotifierProvider).trackingNumber;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
