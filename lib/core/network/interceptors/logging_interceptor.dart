import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ocean_friends_app/core/utils/app_logger.dart';

/// Logs outgoing requests and incoming responses for debugging.
@injectable
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
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    AppLogger.d(
      '← [${response.statusCode}] ${response.requestOptions.uri}\n'
      '   Data: ${response.data.toString().substring(0, response.data.toString().length.clamp(0, 200))}...',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.e(
      '✕ [${err.response?.statusCode}] ${err.requestOptions.uri}\n'
      '   Message: ${err.message}',
      error: err,
      stackTrace: err.stackTrace,
    );
    handler.next(err);
  }
}
