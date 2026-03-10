import 'package:equatable/equatable.dart';

/// Represents a meal recipe in the domain layer.
class Recipe extends Equatable {
  const Recipe({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  @override
  List<Object?> get props => [
    idMeal,
    strMeal,
    strMealThumb,
  ];
}
