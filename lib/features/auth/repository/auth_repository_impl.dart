import 'package:fpdart/fpdart.dart';
import 'package:postman/core/constants/api_endpoints.dart';
import 'package:postman/core/error/failure.dart';
import 'package:postman/core/network/api_client.dart';
import 'package:postman/core/network/connection_checker.dart';
import 'package:postman/core/services/secure_store_service.dart';
import 'package:postman/features/auth/model/auth_token.dart';
import 'package:postman/features/auth/model/postman_user.dart';
import 'package:postman/features/auth/repository/auth_repository.dart';

/// Implementation of [AuthRepository] that handles remote API calls
/// and local token storage.
class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;
  final SecureStorageService _secureStorage;
  final ConnectionChecker _connectionChecker;

  AuthRepositoryImpl({
    required ApiClient apiClient,
    required SecureStorageService secureStorage,
    required ConnectionChecker connectionChecker,
  }) : _apiClient = apiClient,
       _secureStorage = secureStorage,
       _connectionChecker = connectionChecker;

  @override
  Future<Either<Failure, AuthToken>> login({
    required String employeeId,
    required String password,
  }) async {
    // Check network connectivity first
    if (!await _connectionChecker.isConnected) {
      return left(const Failure.network());
    }

    return _apiClient.post<AuthToken>(
      ApiEndpoints.loginJson,
      fromJson: AuthToken.fromJson,
      body: {'employee_id': employeeId, 'password': password},
      requiresAuth: false,
    );
  }

  @override
  Future<Either<Failure, AuthToken>> loginWithForm({
    required String username,
    required String password,
  }) async {
    if (!await _connectionChecker.isConnected) {
      return left(const Failure.network());
    }

    return _apiClient.postForm<AuthToken>(
      ApiEndpoints.login,
      fromJson: AuthToken.fromJson,
      body: {'username': username, 'password': password},
    );
  }

  @override
  Future<Either<Failure, PostmanUser>> getCurrentUser() async {
    if (!await _connectionChecker.isConnected) {
      return left(const Failure.network());
    }

    return _apiClient.get<PostmanUser>(
      ApiEndpoints.me,
      fromJson: PostmanUser.fromJson,
    );
  }

  @override
  Future<Either<Failure, Unit>> saveToken(String token) async {
    try {
      await _secureStorage.saveCredentials(token);
      return right(unit);
    } catch (e) {
      return left(Failure.cache(message: 'Failed to save token: $e'));
    }
  }

  @override
  Future<String?> getStoredToken() async {
    try {
      return await _secureStorage.getToken();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Either<Failure, Unit>> clearToken() async {
    try {
      await _secureStorage.clearToken();
      return right(unit);
    } catch (e) {
      return left(Failure.cache(message: 'Failed to clear token: $e'));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getStoredToken();
    return token != null && token.isNotEmpty;
  }
}
