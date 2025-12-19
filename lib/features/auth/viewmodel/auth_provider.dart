import 'dart:async';

import 'package:postman/core/providers/core_providers.dart';
import 'package:postman/features/auth/model/postman_user.dart';
import 'package:postman/features/auth/repository/auth_repository.dart';
import 'package:postman/features/auth/repository/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

/// Provides the AuthRepository instance
@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    apiClient: ref.watch(apiClientProvider),
    secureStorage: ref.watch(secureStorageServiceProvider),
    connectionChecker: ref.watch(connectionCheckerProvider),
  );
}

/// Represents the authentication state of the app
sealed class AuthState {
  const AuthState();
}

/// Initial state - checking if user is authenticated
class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

/// User is authenticated
class AuthStateAuthenticated extends AuthState {
  final PostmanUser user;
  const AuthStateAuthenticated(this.user);
}

/// User is not authenticated
class AuthStateUnauthenticated extends AuthState {
  const AuthStateUnauthenticated();
}

/// Authentication in progress (logging in)
class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

/// Authentication failed
class AuthStateError extends AuthState {
  final String message;
  const AuthStateError(this.message);
}

/// Main Auth ViewModel that manages authentication state across the app.
/// This is kept alive as authentication state is global.
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.read(authRepositoryProvider);
    // Check authentication status on startup
    _checkAuthStatus();
    return const AuthStateInitial();
  }

  /// Check if user is already authenticated on app startup
  Future<void> _checkAuthStatus() async {
    final isAuthenticated = await _repository.isAuthenticated();

    if (isAuthenticated) {
      // Try to get current user profile
      final result = await _repository.getCurrentUser();
      result.match(
        (failure) {
          // Token might be expired, clear it
          _repository.clearToken();
          state = const AuthStateUnauthenticated();
        },
        (user) {
          state = AuthStateAuthenticated(user);
        },
      );
    } else {
      state = const AuthStateUnauthenticated();
    }
  }

  /// Login with employee ID and password
  Future<void> login({
    required String employeeId,
    required String password,
  }) async {
    state = const AuthStateLoading();

    // Step 1: Authenticate and get token
    final loginResult = await _repository.login(
      employeeId: employeeId,
      password: password,
    );

    await loginResult.match(
      (failure) async {
        state = AuthStateError(failure.message);
      },
      (token) async {
        // Step 2: Save the token
        final saveResult = await _repository.saveToken(token.accessToken);

        await saveResult.match(
          (failure) async {
            state = AuthStateError(failure.message);
          },
          (_) async {
            // Step 3: Get user profile
            final userResult = await _repository.getCurrentUser();
            userResult.match(
              (failure) {
                state = AuthStateError(failure.message);
              },
              (user) {
                state = AuthStateAuthenticated(user);
              },
            );
          },
        );
      },
    );
  }

  /// Logout the user
  Future<void> logout() async {
    await _repository.clearToken();
    state = const AuthStateUnauthenticated();
  }

  /// Refresh the current user's profile
  Future<void> refreshUser() async {
    if (state is! AuthStateAuthenticated) return;

    final result = await _repository.getCurrentUser();
    result.match(
      (failure) {
        // Don't change state on refresh failure, just log
      },
      (user) {
        state = AuthStateAuthenticated(user);
      },
    );
  }

  /// Get the current authenticated user (if any)
  PostmanUser? get currentUser {
    final currentState = state;
    if (currentState is AuthStateAuthenticated) {
      return currentState.user;
    }
    return null;
  }

  /// Check if user is currently authenticated
  bool get isAuthenticated => state is AuthStateAuthenticated;
}
