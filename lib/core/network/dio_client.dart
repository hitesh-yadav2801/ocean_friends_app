import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/constants/api_constants.dart';
import 'package:ocean_friends_app/core/network/interceptors/error_interceptor.dart';
import 'package:ocean_friends_app/core/network/interceptors/logging_interceptor.dart';

/// A configured [Dio] HTTP client shared across all API data sources.
///
/// Sets up base URL, timeouts, headers, and attaches all interceptors.
/// Shared HTTP client instance configured with interceptors and base settings.
@lazySingleton
class DioClient {
  DioClient({
    LoggingInterceptor? loggingInterceptor,
    ErrorInterceptor? errorInterceptor,
  }) : _dio = _buildDio() {
    _dio.interceptors.addAll([
      if (loggingInterceptor != null) loggingInterceptor,
      errorInterceptor ?? ErrorInterceptor(),
    ]);
  }

  final Dio _dio;

  /// The underlying [Dio] instance — inject this into data sources.
  Dio get dio => _dio;

  /// Creates a [Dio] instance with project-standard configuration.
  static Dio _buildDio() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(
          seconds: ApiConstants.connectTimeoutSeconds,
        ),
        receiveTimeout: const Duration(
          seconds: ApiConstants.receiveTimeoutSeconds,
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }
}
