import 'package:dio/dio.dart';
import 'package:ocean_friends_app/core/utils/app_logger.dart';

/// Dio interceptor that logs every request and response in a readable format.
///
/// Only logs in debug mode — production builds are unaffected because the
/// [AppLogger] level can be configured per environment.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.d(
      '→ [${options.method}] ${options.uri}\n'
      '   Headers: ${options.headers}\n'
      '   Query:   ${options.queryParameters}',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    AppLogger.d(
      '← [${response.statusCode}] ${response.requestOptions.uri}\n'
      '   Data: ${response.data.toString().substring(0, response.data.toString().length.clamp(0, 200))}...',
    );
    handler.next(response);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    AppLogger.e(
      '✕ [${error.response?.statusCode}] ${error.requestOptions.uri}\n'
      '   Message: ${error.message}',
      error: error,
      stackTrace: error.stackTrace,
    );
    handler.next(error);
  }
}
