import 'package:fpdart/fpdart.dart';

/// Sealed class hierarchy representing all possible failure types in the app.
///
/// Every repository method returns `Either<Failure, T>` — success on [Right],
/// failure on [Left]. This forces callers to handle errors explicitly.
sealed class Failure {
  const Failure(this.message);

  /// Human-readable description of what went wrong.
  final String message;
}

/// Failure caused by a network or HTTP error (e.g. server returned 4xx or 5xx).
final class ServerFailure extends Failure {
  const ServerFailure({required String message, this.statusCode})
    : super(message);

  /// Optional HTTP status code returned by the server.
  final int? statusCode;
}

/// Failure caused by no internet connection or a connection timeout.
final class NetworkFailure extends Failure {
  const NetworkFailure({
    String message =
        'No internet connection. Please check your network and try again.',
  }) : super(message);
}

/// Failure caused by JSON parsing or data type mismatch errors.
final class ParseFailure extends Failure {
  const ParseFailure({String message = 'Failed to parse server response.'})
    : super(message);
}

/// Failure representing an empty result set (successful HTTP but no data).
///
/// Kept separate from [ServerFailure] so UI can render a distinct empty state.
final class EmptyResultFailure extends Failure {
  const EmptyResultFailure({String message = 'No results found.'})
    : super(message);
}

/// Failure for locally stored data that could not be read or written.
final class CacheFailure extends Failure {
  const CacheFailure({
    String message = 'Local storage error. Please try again.',
  }) : super(message);
}

/// A convenience type alias — repositories return this instead of the verbose form.
typedef AppResult<T> = Either<Failure, T>;
