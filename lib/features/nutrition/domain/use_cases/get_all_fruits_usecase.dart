import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/core/usecase/usecase.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/fruit.dart';
import 'package:ocean_friends_app/features/nutrition/domain/repositories/fruit_repository.dart';

@lazySingleton
class GetAllFruitsUseCase implements UseCase<List<Fruit>, NoParams> {
  const GetAllFruitsUseCase(this.repository);

  final FruitRepository repository;

  @override
  Future<AppResult<List<Fruit>>> call(NoParams params) {
    return repository.getAllFruits();
  }
}
