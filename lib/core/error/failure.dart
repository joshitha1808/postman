import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Represents all possible failure types in the application.
/// Uses Freezed for immutable union types.
@freezed
sealed class Failure with _$Failure {
  /// Server/API related failures
  const factory Failure.server({
    required String message,
    String? errorCode,
    int? statusCode,
  }) = ServerFailure;

  /// Network connectivity failures
  const factory Failure.network({
    @Default('No internet connection') String message,
  }) = NetworkFailure;

  /// Authentication failures (invalid credentials, expired token, etc.)
  const factory Failure.auth({required String message, String? errorCode}) =
      AuthFailure;

  /// Validation failures (invalid input, etc.)
  const factory Failure.validation({required String message, String? field}) =
      ValidationFailure;

  /// Cache/Storage failures
  const factory Failure.cache({required String message}) = CacheFailure;

  /// Unknown/unexpected failures
  const factory Failure.unknown({
    @Default('An unexpected error occurred') String message,
    Object? cause,
  }) = UnknownFailure;

  /// Maps API error codes to user-friendly messages
  static Failure fromApiError({
    required int statusCode,
    String? errorCode,
    String? detail,
  }) {
    switch (statusCode) {
      case 401:
        return Failure.auth(
          message: detail ?? 'Authentication required. Please login again.',
          errorCode: errorCode ?? 'UNAUTHORIZED',
        );
      case 403:
        return Failure.auth(
          message:
              detail ?? 'You do not have permission to perform this action.',
          errorCode: errorCode ?? 'FORBIDDEN',
        );
      case 404:
        return Failure.server(
          message: detail ?? 'Resource not found.',
          errorCode: errorCode ?? 'NOT_FOUND',
          statusCode: statusCode,
        );
      case 422:
        return Failure.validation(message: detail ?? 'Invalid data provided.');
      case >= 500:
        return Failure.server(
          message: detail ?? 'Server error. Please try again later.',
          errorCode: errorCode ?? 'SERVER_ERROR',
          statusCode: statusCode,
        );
      default:
        return Failure.server(
          message: detail ?? 'Something went wrong.',
          statusCode: statusCode,
        );
    }
  }
}
