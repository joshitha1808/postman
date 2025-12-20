// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsRepositoryHash() =>
    r'4ea07642941fbb86b72b72144c840e631c70ac8f';

/// Provides the SettingsRepository instance
///
/// Copied from [settingsRepository].
@ProviderFor(settingsRepository)
final settingsRepositoryProvider =
    AutoDisposeProvider<SettingsRepository>.internal(
      settingsRepository,
      name: r'settingsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$settingsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsRepositoryRef = AutoDisposeProviderRef<SettingsRepository>;
String _$dutyNotifierHash() => r'296367f40c5ca8378c0e19af965066412167af3d';

/// Notifier for managing duty status
///
/// Copied from [DutyNotifier].
@ProviderFor(DutyNotifier)
final dutyNotifierProvider =
    AutoDisposeNotifierProvider<DutyNotifier, DutyState>.internal(
      DutyNotifier.new,
      name: r'dutyNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dutyNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DutyNotifier = AutoDisposeNotifier<DutyState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
