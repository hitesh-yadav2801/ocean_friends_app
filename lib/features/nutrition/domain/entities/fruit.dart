import 'package:equatable/equatable.dart';

import 'package:ocean_friends_app/features/nutrition/domain/entities/nutrition_values.dart';

class Fruit extends Equatable {
  const Fruit({
    required this.id,
    required this.name,
    required this.family,
    required this.order,
    required this.genus,
    required this.nutrition,
  });

  final int id;
  final String name;
  final String family;
  final String order;
  final String genus;
  final NutritionValues nutrition;

  @override
  List<Object?> get props => [
    id,
    name,
    family,
    order,
    genus,
    nutrition,
  ];
}
