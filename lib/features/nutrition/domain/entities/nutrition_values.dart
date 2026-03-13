import 'package:equatable/equatable.dart';

class NutritionValues extends Equatable {
  const NutritionValues({
    required this.calories,
    required this.fat,
    required this.sugar,
    required this.carbohydrates,
    required this.protein,
  });

  static const NutritionValues zero = NutritionValues(
    calories: 0,
    fat: 0,
    sugar: 0,
    carbohydrates: 0,
    protein: 0,
  );

  static const NutritionValues defaultDailyLimits = NutritionValues(
    calories: 2000,
    fat: 70,
    sugar: 50,
    carbohydrates: 275,
    protein: 50,
  );

  final double calories;
  final double fat;
  final double sugar;
  final double carbohydrates;
  final double protein;

  NutritionValues operator +(NutritionValues other) {
    return NutritionValues(
      calories: calories + other.calories,
      fat: fat + other.fat,
      sugar: sugar + other.sugar,
      carbohydrates: carbohydrates + other.carbohydrates,
      protein: protein + other.protein,
    );
  }

  NutritionValues multiply(int quantity) {
    return NutritionValues(
      calories: calories * quantity,
      fat: fat * quantity,
      sugar: sugar * quantity,
      carbohydrates: carbohydrates * quantity,
      protein: protein * quantity,
    );
  }

  List<String> exceededNutrients(NutritionValues limits) {
    final exceeded = <String>[];

    if (calories > limits.calories) exceeded.add('Calories');
    if (fat > limits.fat) exceeded.add('Fat');
    if (sugar > limits.sugar) exceeded.add('Sugar');
    if (carbohydrates > limits.carbohydrates) exceeded.add('Carbohydrates');
    if (protein > limits.protein) exceeded.add('Protein');

    return exceeded;
  }

  @override
  List<Object?> get props => [
    calories,
    fat,
    sugar,
    carbohydrates,
    protein,
  ];
}
