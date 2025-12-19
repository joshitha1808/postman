import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:postman/core/network/api_client.dart';
import 'package:postman/core/network/connection_checker.dart';
import 'package:postman/core/services/secure_store_service.dart';
import 'package:postman/init_dependencies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_providers.g.dart';

/// Provides the HTTP client
@Riverpod(keepAlive: true)
http.Client httpClient(Ref ref) {
  return serviceLocator<http.Client>();
}

/// Provides the SecureStorageService
@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(Ref ref) {
  return serviceLocator<SecureStorageService>();
}

/// Provides the ConnectionChecker
@Riverpod(keepAlive: true)
ConnectionChecker connectionChecker(Ref ref) {
  return serviceLocator<ConnectionChecker>();
}

/// Provides the ApiClient with all dependencies
@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  return ApiClient(
    client: ref.watch(httpClientProvider),
    secureStorage: ref.watch(secureStorageServiceProvider),
  );
}
