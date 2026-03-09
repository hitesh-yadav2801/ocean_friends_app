import 'package:equatable/equatable.dart';

import 'package:ocean_friends_app/core/errors/failures.dart';

/// Base UseCase interface for all use cases in the app.
/// [T] is the return type of the use case.
/// [Params] is the type of the parameters passed to the use case.
abstract class UseCase<T, Params> {
  Future<AppResult<T>> call(Params params);
}

/// A class representing no parameters for use cases that don't need any.
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
