// The repository contract intentionally exposes a single method.
// ignore_for_file: one_member_abstracts

import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/fruit.dart';

abstract class FruitRepository {
  Future<AppResult<List<Fruit>>> getAllFruits();
}
