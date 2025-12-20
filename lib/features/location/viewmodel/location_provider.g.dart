// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationServiceHash() => r'3b3077729fc0ea286d891106ad873cff531a8bd5';

/// Provides the LocationService instance
///
/// Copied from [locationService].
@ProviderFor(locationService)
final locationServiceProvider = AutoDisposeProvider<LocationService>.internal(
  locationService,
  name: r'locationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationServiceRef = AutoDisposeProviderRef<LocationService>;
String _$locationWebSocketServiceHash() =>
    r'0b5668d9427746d40fa2bb5684b12006a2cd9751';

/// Provides the LocationWebSocketService instance
///
/// Copied from [locationWebSocketService].
@ProviderFor(locationWebSocketService)
final locationWebSocketServiceProvider =
    AutoDisposeProvider<LocationWebSocketService>.internal(
      locationWebSocketService,
      name: r'locationWebSocketServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationWebSocketServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationWebSocketServiceRef =
    AutoDisposeProviderRef<LocationWebSocketService>;
String _$locationRepositoryHash() =>
    r'92d2393b6787fea925d19c4b1e5901abec616824';

/// Provides the LocationRepository instance
///
/// Copied from [locationRepository].
@ProviderFor(locationRepository)
final locationRepositoryProvider =
    AutoDisposeProvider<LocationRepository>.internal(
      locationRepository,
      name: r'locationRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationRepositoryRef = AutoDisposeProviderRef<LocationRepository>;
String _$locationTrackingNotifierHash() =>
    r'0fb3e1bf0503cc2615486f69b28126568147155f';

/// Notifier for location tracking
///
/// Copied from [LocationTrackingNotifier].
@ProviderFor(LocationTrackingNotifier)
final locationTrackingNotifierProvider =
    AutoDisposeNotifierProvider<
      LocationTrackingNotifier,
      LocationTrackingState
    >.internal(
      LocationTrackingNotifier.new,
      name: r'locationTrackingNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationTrackingNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LocationTrackingNotifier = AutoDisposeNotifier<LocationTrackingState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
