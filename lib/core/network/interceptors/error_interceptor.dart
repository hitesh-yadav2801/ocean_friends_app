import 'package:dio/dio.dart';
import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/core/utils/app_logger.dart';

/// Maps [DioException] to domain-specific [Failure] types.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = _mapToFailure(err);

    AppLogger.w('Network error mapped → ${failure.runtimeType}: ${failure.message}');

    // Store the typed failure so data sources can unwrap it.
    final enrichedError = err.copyWith(
      // ignore: avoid_dynamic_calls — dynamic extras map is Dio's convention.
      message: failure.message,
    );
    handler.next(enrichedError);
  }

  /// Converts a [DioException] into an appropriate [Failure] subtype.
  Failure _mapToFailure(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        return ServerFailure(
          statusCode: statusCode,
          message: _messageForStatus(statusCode),
        );

      case DioExceptionType.badCertificate:
        return const NetworkFailure(
          message: 'SSL certificate error. Connection is not secure.',
        );

      case DioExceptionType.cancel:
        return const NetworkFailure(message: 'Request was cancelled.');

      case DioExceptionType.unknown:
        return ServerFailure(
          message: error.message ?? 'An unexpected error occurred.',
        );
    }
  }

  /// Returns a user-friendly message for common HTTP status codes.
  String _messageForStatus(int? statusCode) {
    return switch (statusCode) {
      400 => 'Bad request. Please try again.',
      401 => 'Unauthorised. Please log in again.',
      403 => 'Access denied.',
      404 => 'The requested resource was not found.',
      429 => 'Too many requests. Please slow down.',
      500 || 502 || 503 => 'Server error. Please try again later.',
      _ => 'Something went wrong (HTTP $statusCode).',
    };
  }
}
