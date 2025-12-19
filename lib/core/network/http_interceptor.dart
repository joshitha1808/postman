import 'dart:async';
import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:postman/core/services/secure_store_service.dart';
import 'package:postman/init_dependencies.dart';

/// HTTP Interceptor that adds authentication headers to requests
/// and handles token expiration.
class HttpRequestInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final secureStorage = serviceLocator.get<SecureStorageService>();

    try {
      final token = await secureStorage.getToken();
      if (token != null && token.isNotEmpty) {
        log("Intercepting request: ${request.url}");
        request.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      log("Error getting token: $e");
    }

    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    log("Response [${response.statusCode}]: ${response.reasonPhrase}");

    // Handle 401 responses - token might be expired
    if (response.statusCode == 401) {
      log("Received 401 - token may be expired");
      // The auth provider will handle logout when API returns 401
    }

    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}
