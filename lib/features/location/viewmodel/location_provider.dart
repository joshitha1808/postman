import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:postman/core/constants/api_endpoints.dart';
import 'package:postman/core/providers/core_providers.dart';
import 'package:postman/features/auth/viewmodel/auth_provider.dart';
import 'package:postman/features/location/model/location_models.dart';
import 'package:postman/features/location/repository/location_repository.dart';
import 'package:postman/features/location/service/location_service.dart';
import 'package:postman/features/location/service/location_websocket_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

/// Provides the LocationService instance
@riverpod
LocationService locationService(LocationServiceRef ref) {
  final service = LocationService();
  ref.onDispose(() => service.dispose());
  return service;
}

/// Provides the LocationWebSocketService instance
@riverpod
LocationWebSocketService locationWebSocketService(
  LocationWebSocketServiceRef ref,
) {
  final service = LocationWebSocketService();
  ref.onDispose(() => service.dispose());
  return service;
}

/// Provides the LocationRepository instance
@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepositoryImpl(apiClient: ref.watch(apiClientProvider));
}

/// State for location tracking
class LocationTrackingState {
  final bool isTracking;
  final bool isWebSocketConnected;
  final Position? lastPosition;
  final DateTime? lastUpdateTime;
  final String? error;
  final int updateCount;

  const LocationTrackingState({
    this.isTracking = false,
    this.isWebSocketConnected = false,
    this.lastPosition,
    this.lastUpdateTime,
    this.error,
    this.updateCount = 0,
  });

  LocationTrackingState copyWith({
    bool? isTracking,
    bool? isWebSocketConnected,
    Position? lastPosition,
    DateTime? lastUpdateTime,
    String? error,
    bool clearError = false,
    int? updateCount,
  }) {
    return LocationTrackingState(
      isTracking: isTracking ?? this.isTracking,
      isWebSocketConnected: isWebSocketConnected ?? this.isWebSocketConnected,
      lastPosition: lastPosition ?? this.lastPosition,
      lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
      error: clearError ? null : (error ?? this.error),
      updateCount: updateCount ?? this.updateCount,
    );
  }
}

/// Notifier for location tracking
@riverpod
class LocationTrackingNotifier extends _$LocationTrackingNotifier {
  LocationService get _locationService => ref.read(locationServiceProvider);
  LocationWebSocketService get _webSocketService =>
      ref.read(locationWebSocketServiceProvider);
  LocationRepository get _repository => ref.read(locationRepositoryProvider);

  StreamSubscription<Position>? _positionSubscription;
  StreamSubscription<bool>? _connectionSubscription;

  @override
  LocationTrackingState build() {
    ref.onDispose(() {
      _positionSubscription?.cancel();
      _connectionSubscription?.cancel();
    });
    return const LocationTrackingState();
  }

  /// Start location tracking and WebSocket connection
  Future<bool> startTracking() async {
    if (state.isTracking) return true;

    // Get auth info for WebSocket connection
    final authState = ref.read(authNotifierProvider);
    if (authState is! AuthStateAuthenticated) {
      state = state.copyWith(error: 'Not authenticated');
      return false;
    }

    final postmanId = authState.user.id;
    final token = await ref.read(secureStorageServiceProvider).getToken();
    if (token == null) {
      state = state.copyWith(error: 'No auth token');
      return false;
    }

    // Start GPS tracking
    final trackingStarted = await _locationService.startTracking(
      intervalSeconds: 15,
      distanceFilter: 10,
    );

    if (!trackingStarted) {
      state = state.copyWith(error: 'Failed to start GPS tracking');
      return false;
    }

    // Connect WebSocket
    final wsUrl = ApiEndpoints.locationWebSocket(postmanId, token);
    await _webSocketService.connect(wsUrl);

    // Listen to connection status
    _connectionSubscription = _webSocketService.connectionStream.listen((
      connected,
    ) {
      state = state.copyWith(isWebSocketConnected: connected);
    });

    // Listen to position updates
    _positionSubscription = _locationService.positionStream.listen(
      (position) => _onPositionUpdate(position),
    );

    state = state.copyWith(isTracking: true, clearError: true);

    return true;
  }

  /// Handle position update
  void _onPositionUpdate(Position position) {
    final update = LocationUpdate(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      altitude: position.altitude,
      speed: position.speed,
      heading: position.heading,
      timestamp: DateTime.now().toUtc().toIso8601String(),
    );

    // Send via WebSocket if connected
    if (_webSocketService.isConnected) {
      _webSocketService.sendLocationUpdate(update);
    } else {
      // Fallback to REST API
      _sendViaRest(update);
    }

    state = state.copyWith(
      lastPosition: position,
      lastUpdateTime: DateTime.now(),
      updateCount: state.updateCount + 1,
    );
  }

  /// Send location update via REST API (fallback)
  Future<void> _sendViaRest(LocationUpdate update) async {
    final result = await _repository.sendLocationUpdate(update);
    result.match(
      (failure) => state = state.copyWith(error: failure.message),
      (_) => state = state.copyWith(clearError: true),
    );
  }

  /// Stop location tracking
  Future<void> stopTracking() async {
    await _positionSubscription?.cancel();
    _positionSubscription = null;

    await _connectionSubscription?.cancel();
    _connectionSubscription = null;

    await _locationService.stopTracking();
    await _webSocketService.disconnect();

    state = state.copyWith(isTracking: false, isWebSocketConnected: false);
  }

  /// Toggle tracking on/off
  Future<bool> toggleTracking() async {
    if (state.isTracking) {
      await stopTracking();
      return false;
    } else {
      return await startTracking();
    }
  }

  /// Request location permission
  Future<bool> requestPermission() async {
    return await _locationService.checkAndRequestPermissions();
  }

  /// Get current position once
  Future<Position?> getCurrentPosition() async {
    return await _locationService.getCurrentPosition();
  }
}
