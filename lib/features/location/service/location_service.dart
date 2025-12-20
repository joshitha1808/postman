import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';

/// Service for handling GPS location tracking
class LocationService {
  StreamSubscription<Position>? _positionSubscription;
  final _positionController = StreamController<Position>.broadcast();

  /// Stream of position updates
  Stream<Position> get positionStream => _positionController.stream;

  /// Check and request location permissions
  Future<bool> checkAndRequestPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
      return false;
    }

    // Check permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied');
      return false;
    }

    return true;
  }

  /// Get current position once
  Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await checkAndRequestPermissions();
      if (!hasPermission) return null;

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
    } catch (e) {
      log('Error getting current position: $e');
      return null;
    }
  }

  /// Start continuous location tracking
  Future<bool> startTracking({
    int intervalSeconds = 15,
    int distanceFilter = 10,
  }) async {
    try {
      final hasPermission = await checkAndRequestPermissions();
      if (!hasPermission) return false;

      // Stop any existing tracking
      await stopTracking();

      log(
        'Starting location tracking (interval: ${intervalSeconds}s, distance: ${distanceFilter}m)',
      );

      // Configure location settings
      final locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: distanceFilter,
        intervalDuration: Duration(seconds: intervalSeconds),
        forceLocationManager: false,
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              'Postman app is tracking your location for deliveries',
          notificationTitle: 'Location Tracking Active',
          enableWakeLock: true,
        ),
      );

      // Start listening to position updates
      _positionSubscription =
          Geolocator.getPositionStream(
            locationSettings: locationSettings,
          ).listen(
            (Position position) {
              log(
                'Position update: ${position.latitude}, ${position.longitude}',
              );
              _positionController.add(position);
            },
            onError: (error) {
              log('Position stream error: $error');
            },
          );

      return true;
    } catch (e) {
      log('Error starting tracking: $e');
      return false;
    }
  }

  /// Stop location tracking
  Future<void> stopTracking() async {
    await _positionSubscription?.cancel();
    _positionSubscription = null;
    log('Location tracking stopped');
  }

  /// Check if currently tracking
  bool get isTracking => _positionSubscription != null;

  /// Dispose resources
  void dispose() {
    stopTracking();
    _positionController.close();
  }
}
