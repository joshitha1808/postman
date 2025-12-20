import 'package:fpdart/fpdart.dart';
import 'package:postman/core/error/failure.dart';
import 'package:postman/core/network/api_client.dart';
import 'package:postman/core/constants/api_endpoints.dart';

/// Repository for settings-related API calls
abstract class SettingsRepository {
  /// Toggle duty status on/off
  Future<Either<Failure, bool>> toggleDutyStatus({required bool isOnDuty});
}

class SettingsRepositoryImpl implements SettingsRepository {
  final ApiClient _apiClient;

  SettingsRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<Either<Failure, bool>> toggleDutyStatus({
    required bool isOnDuty,
  }) async {
    final result = await _apiClient.post<Map<String, dynamic>>(
      ApiEndpoints.dutyStatus,
      body: {'is_on_duty': isOnDuty},
      fromJson: (json) => json,
    );

    return result.map((response) {
      return response['is_on_duty'] as bool? ?? isOnDuty;
    });
  }
}
