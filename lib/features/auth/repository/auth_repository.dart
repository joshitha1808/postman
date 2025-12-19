import 'package:fpdart/fpdart.dart';
import 'package:postman/core/error/failure.dart';
import 'package:postman/features/auth/model/auth_token.dart';
import 'package:postman/features/auth/model/postman_user.dart';

/// Abstract repository interface for authentication operations.
/// Following the MVVM pattern, this defines the contract for auth data access.
abstract class AuthRepository {
  /// Login with employee ID and password (JSON format)
  /// Returns [AuthToken] on success, [Failure] on error
  Future<Either<Failure, AuthToken>> login({
    required String employeeId,
    required String password,
  });

  /// Login with OAuth2 form-encoded format
  /// Returns [AuthToken] on success, [Failure] on error
  Future<Either<Failure, AuthToken>> loginWithForm({
    required String username,
    required String password,
  });

  /// Get the current authenticated user's profile
  /// Returns [PostmanUser] on success, [Failure] on error
  Future<Either<Failure, PostmanUser>> getCurrentUser();

  /// Save the auth token to secure storage
  Future<Either<Failure, Unit>> saveToken(String token);

  /// Get the stored auth token
  Future<String?> getStoredToken();

  /// Clear the stored auth token (logout)
  Future<Either<Failure, Unit>> clearToken();

  /// Check if user is authenticated (has valid token)
  Future<bool> isAuthenticated();
}
