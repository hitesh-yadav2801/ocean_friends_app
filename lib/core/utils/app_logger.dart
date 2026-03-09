import 'package:logger/logger.dart';

/// Application-wide logging utility wrapping the [Logger] package.
///
/// Provides structured, level-aware console output for all application layers.
///
/// Usage:
/// ```dart
/// AppLogger.d('Fetching categories...');
/// AppLogger.e('API call failed', error: error, stackTrace: st);
/// ```
class AppLogger {
  AppLogger._(); // Prevent instantiation

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      lineLength: 80,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
    level: Level.trace,
  );

  /// Log a verbose/trace message (lowest severity, very detailed info).
  static void t(String message) => _logger.t(message);

  /// Log a debug message (useful during active development).
  static void d(String message) => _logger.d(message);

  /// Log an informational message (notable app lifecycle events).
  static void i(String message) => _logger.i(message);

  /// Log a warning (something unexpected but recoverable happened).
  static void w(String message) => _logger.w(message);

  /// Log an error with optional exception and stack trace.
  static void e(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

  /// Log a fatal error that implies the app cannot continue normally.
  static void f(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) =>
      _logger.f(message, error: error, stackTrace: stackTrace);
}
