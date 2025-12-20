import 'package:fpdart/fpdart.dart';
import 'package:postman/core/constants/api_endpoints.dart';
import 'package:postman/core/error/failure.dart';
import 'package:postman/core/network/api_client.dart';

import '../model/location_models.dart';

/// Repository for location-related API operations
abstract class LocationRepository {
  /// Send location update via REST (fallback when WebSocket is down)
  Future<Either<Failure, LocationUpdateResponse>> sendLocationUpdate(
    LocationUpdate update,
  );

  /// Get current stored location
  Future<Either<Failure, CurrentLocationResponse>> getCurrentLocation();
}

/// Implementation of location repository
class LocationRepositoryImpl implements LocationRepository {
  final ApiClient _apiClient;

  LocationRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<Either<Failure, LocationUpdateResponse>> sendLocationUpdate(
    LocationUpdate update,
  ) async {
    return _apiClient.post<LocationUpdateResponse>(
      ApiEndpoints.locationUpdate,
      body: update.toJson(),
      fromJson: LocationUpdateResponse.fromJson,
    );
  }

  @override
  Future<Either<Failure, CurrentLocationResponse>> getCurrentLocation() async {
    return _apiClient.get<CurrentLocationResponse>(
      ApiEndpoints.locationCurrent,
      fromJson: CurrentLocationResponse.fromJson,
    );
  }
}
