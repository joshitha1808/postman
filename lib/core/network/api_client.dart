import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:postman/core/error/failure.dart';
import 'package:postman/core/services/secure_store_service.dart';

/// A type-safe API client that wraps HTTP calls and returns Either<Failure, T>
class ApiClient {
  final http.Client _client;
  final SecureStorageService _secureStorage;

  ApiClient({
    required http.Client client,
    required SecureStorageService secureStorage,
  }) : _client = client,
       _secureStorage = secureStorage;

  /// Common headers for JSON requests
  Future<Map<String, String>> _getHeaders({bool requiresAuth = true}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requiresAuth) {
      final token = await _secureStorage.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  /// Headers for form-urlencoded requests (OAuth2 login)
  Future<Map<String, String>> _getFormHeaders() async {
    return {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    };
  }

  /// Performs a GET request
  Future<Either<Failure, T>> get<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
    bool requiresAuth = true,
    Map<String, String>? queryParams,
  }) async {
    return _executeRequest(() async {
      final uri = Uri.parse(url).replace(queryParameters: queryParams);
      final headers = await _getHeaders(requiresAuth: requiresAuth);

      log('GET: $uri');
      final response = await _client.get(uri, headers: headers);
      return _handleResponse(response, fromJson);
    });
  }

  /// Performs a POST request with JSON body
  Future<Either<Failure, T>> post<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    return _executeRequest(() async {
      final uri = Uri.parse(url);
      final headers = await _getHeaders(requiresAuth: requiresAuth);

      log('POST: $uri');
      log('Body: ${jsonEncode(body)}');

      final response = await _client.post(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response, fromJson);
    });
  }

  /// Performs a POST request with form-urlencoded body (for OAuth2)
  Future<Either<Failure, T>> postForm<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, String> body,
  }) async {
    return _executeRequest(() async {
      final uri = Uri.parse(url);
      final headers = await _getFormHeaders();

      log('POST (form): $uri');

      final response = await _client.post(uri, headers: headers, body: body);
      return _handleResponse(response, fromJson);
    });
  }

  /// Performs a multipart POST request for file uploads
  Future<Either<Failure, T>> postMultipart<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
    required File file,
    String fileField = 'file',
    Map<String, String>? fields,
    bool requiresAuth = true,
  }) async {
    return _executeRequest(() async {
      final uri = Uri.parse(url);

      log('POST (multipart): $uri');

      final request = http.MultipartRequest('POST', uri);

      // Add auth header
      if (requiresAuth) {
        final token = await _secureStorage.getToken();
        if (token != null) {
          request.headers['Authorization'] = 'Bearer $token';
        }
      }

      // Determine content type from file extension
      final extension = file.path.split('.').last.toLowerCase();
      final mimeType = switch (extension) {
        'jpg' || 'jpeg' => 'image/jpeg',
        'png' => 'image/png',
        'gif' => 'image/gif',
        'webp' => 'image/webp',
        _ => 'application/octet-stream',
      };

      // Add file with content type
      request.files.add(
        await http.MultipartFile.fromPath(
          fileField,
          file.path,
          contentType: MediaType.parse(mimeType),
        ),
      );

      // Add fields
      if (fields != null) {
        request.fields.addAll(fields);
      }

      final streamedResponse = await _client.send(request);
      final response = await http.Response.fromStream(streamedResponse);
      return _handleResponse(response, fromJson);
    });
  }

  /// Performs a multipart POST request for uploading bytes (like signature)
  Future<Either<Failure, T>> postMultipartBytes<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
    required List<int> bytes,
    required String filename,
    String fileField = 'file',
    String contentType = 'image/png',
    Map<String, String>? fields,
    bool requiresAuth = true,
  }) async {
    return _executeRequest(() async {
      final uri = Uri.parse(url);

      log('POST (multipart bytes): $uri');

      final request = http.MultipartRequest('POST', uri);

      // Add auth header
      if (requiresAuth) {
        final token = await _secureStorage.getToken();
        if (token != null) {
          request.headers['Authorization'] = 'Bearer $token';
        }
      }

      // Add bytes as file with content type
      request.files.add(
        http.MultipartFile.fromBytes(
          fileField,
          bytes,
          filename: filename,
          contentType: MediaType.parse(contentType),
        ),
      );

      // Add fields
      if (fields != null) {
        request.fields.addAll(fields);
      }

      final streamedResponse = await _client.send(request);
      final response = await http.Response.fromStream(streamedResponse);
      return _handleResponse(response, fromJson);
    });
  }

  /// Performs a DELETE request
  Future<Either<Failure, T>> delete<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    return _executeRequest(() async {
      final uri = Uri.parse(url);
      final headers = await _getHeaders(requiresAuth: requiresAuth);

      log('DELETE: $uri');

      final response = await _client.delete(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response, fromJson);
    });
  }

  /// Executes request with error handling wrapper
  Future<Either<Failure, T>> _executeRequest<T>(
    Future<Either<Failure, T>> Function() request,
  ) async {
    try {
      return await request();
    } on SocketException {
      return left(const Failure.network());
    } on TimeoutException {
      return left(const Failure.network(message: 'Request timed out'));
    } on http.ClientException catch (e) {
      return left(Failure.network(message: e.message));
    } catch (e, st) {
      log('Unexpected error: $e', stackTrace: st);
      return left(Failure.unknown(cause: e));
    }
  }

  /// Handles HTTP response and converts to Either<Failure, T>
  Either<Failure, T> _handleResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    log('Response [${response.statusCode}]: ${response.body}');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return right(fromJson(json));
      } catch (e) {
        return left(
          Failure.unknown(message: 'Failed to parse response', cause: e),
        );
      }
    }

    // Parse error response
    try {
      final errorJson = jsonDecode(response.body) as Map<String, dynamic>;
      final detail = errorJson['detail'];

      // Handle FastAPI validation errors (array format)
      String? errorMessage;
      if (detail is List && detail.isNotEmpty) {
        errorMessage = (detail.first as Map<String, dynamic>)['msg'] as String?;
      } else if (detail is String) {
        errorMessage = detail;
      }

      return left(
        Failure.fromApiError(
          statusCode: response.statusCode,
          errorCode: errorJson['error_code'] as String?,
          detail: errorMessage,
        ),
      );
    } catch (_) {
      return left(
        Failure.fromApiError(
          statusCode: response.statusCode,
          detail: response.reasonPhrase,
        ),
      );
    }
  }
}
