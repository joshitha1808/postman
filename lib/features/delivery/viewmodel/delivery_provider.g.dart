// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deliveryRepositoryHash() =>
    r'85a8d509845a6b9fbc170481ea8b20317550f2b9';

/// Provides the DeliveryRepository instance
///
/// Copied from [deliveryRepository].
@ProviderFor(deliveryRepository)
final deliveryRepositoryProvider = Provider<DeliveryRepository>.internal(
  deliveryRepository,
  name: r'deliveryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deliveryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeliveryRepositoryRef = ProviderRef<DeliveryRepository>;
String _$deliveryNotifierHash() => r'8de766d01d5973929d4fc4aaa18c6c1bced8fbf7';

/// Main ViewModel for delivery list operations
///
/// Copied from [DeliveryNotifier].
@ProviderFor(DeliveryNotifier)
final deliveryNotifierProvider =
    AutoDisposeNotifierProvider<DeliveryNotifier, DeliveryListState>.internal(
      DeliveryNotifier.new,
      name: r'deliveryNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$deliveryNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DeliveryNotifier = AutoDisposeNotifier<DeliveryListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
