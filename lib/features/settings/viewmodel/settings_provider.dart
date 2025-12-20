import 'package:postman/core/providers/core_providers.dart';
import 'package:postman/features/auth/viewmodel/auth_provider.dart';
import 'package:postman/features/location/viewmodel/location_provider.dart';
import 'package:postman/features/settings/repository/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

/// Provides the SettingsRepository instance
@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  return SettingsRepositoryImpl(apiClient: ref.watch(apiClientProvider));
}

/// State for duty status
class DutyState {
  final bool isOnDuty;
  final bool isLoading;
  final String? errorMessage;
  final DateTime? lastUpdated;

  const DutyState({
    this.isOnDuty = false,
    this.isLoading = false,
    this.errorMessage,
    this.lastUpdated,
  });

  DutyState copyWith({
    bool? isOnDuty,
    bool? isLoading,
    String? errorMessage,
    DateTime? lastUpdated,
  }) {
    return DutyState(
      isOnDuty: isOnDuty ?? this.isOnDuty,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  String get formattedLastUpdated {
    if (lastUpdated == null) return '';
    final hour = lastUpdated!.hour;
    final minute = lastUpdated!.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}

/// Notifier for managing duty status
@riverpod
class DutyNotifier extends _$DutyNotifier {
  SettingsRepository get _repository => ref.read(settingsRepositoryProvider);

  @override
  DutyState build() {
    // Initialize from auth state
    final authState = ref.watch(authNotifierProvider);
    if (authState is AuthStateAuthenticated) {
      return DutyState(
        isOnDuty: authState.user.isOnDuty,
        lastUpdated: DateTime.now(),
      );
    }

    return const DutyState();
  }

  /// Toggle duty status
  Future<void> toggleDuty() async {
    final newStatus = !state.isOnDuty;
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.toggleDutyStatus(isOnDuty: newStatus);

    result.match(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (isOnDuty) {
        state = state.copyWith(
          isOnDuty: isOnDuty,
          isLoading: false,
          lastUpdated: DateTime.now(),
        );

        // Start/stop location tracking based on duty status
        final locationNotifier = ref.read(
          locationTrackingNotifierProvider.notifier,
        );
        if (isOnDuty) {
          locationNotifier.startTracking();
        } else {
          locationNotifier.stopTracking();
        }

        // Refresh auth state to update user's duty status
        ref.read(authNotifierProvider.notifier).refreshUser();
      },
    );
  }
}
