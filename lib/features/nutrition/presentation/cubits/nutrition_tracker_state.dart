import 'package:equatable/equatable.dart';

import 'package:ocean_friends_app/features/nutrition/domain/entities/fruit.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/nutrition_values.dart';

enum NutritionTrackerStatus { initial, loading, loaded, error }

enum NutritionSnackbarType { none, warning, success, info }

class CartFruitItem extends Equatable {
  const CartFruitItem({required this.fruit, required this.quantity});

  final Fruit fruit;
  final int quantity;

  NutritionValues get totalNutrition => fruit.nutrition.multiply(quantity);

  @override
  List<Object?> get props => [fruit, quantity];
}

class NutritionTrackerState extends Equatable {
  const NutritionTrackerState({
    required this.status,
    required this.fruits,
    required this.quantities,
    required this.dailyLimits,
    required this.snackbarType,
    required this.snackbarId,
    this.errorMessage,
    this.snackbarMessage,
  });

  factory NutritionTrackerState.initial() {
    return const NutritionTrackerState(
      status: NutritionTrackerStatus.initial,
      fruits: [],
      quantities: {},
      dailyLimits: NutritionValues.defaultDailyLimits,
      snackbarType: NutritionSnackbarType.none,
      snackbarId: 0,
    );
  }

  final NutritionTrackerStatus status;
  final List<Fruit> fruits;
  final Map<int, int> quantities;
  final NutritionValues dailyLimits;
  final String? errorMessage;
  final String? snackbarMessage;
  final NutritionSnackbarType snackbarType;
  final int snackbarId;

  NutritionValues get totalNutrition {
    var total = NutritionValues.zero;
    for (final fruit in fruits) {
      final quantity = quantities[fruit.id] ?? 0;
      if (quantity > 0) {
        total += fruit.nutrition.multiply(quantity);
      }
    }
    return total;
  }

  int get totalItemCount {
    return quantities.values.fold<int>(0, (sum, quantity) => sum + quantity);
  }

  List<CartFruitItem> get cartItems {
    return fruits
        .where((fruit) => (quantities[fruit.id] ?? 0) > 0)
        .map(
          (fruit) => CartFruitItem(
            fruit: fruit,
            quantity: quantities[fruit.id] ?? 0,
          ),
        )
        .toList();
  }

  NutritionTrackerState copyWith({
    NutritionTrackerStatus? status,
    List<Fruit>? fruits,
    Map<int, int>? quantities,
    NutritionValues? dailyLimits,
    String? errorMessage,
    String? snackbarMessage,
    NutritionSnackbarType? snackbarType,
    int? snackbarId,
    bool clearError = false,
    bool clearSnackbar = false,
  }) {
    return NutritionTrackerState(
      status: status ?? this.status,
      fruits: fruits ?? this.fruits,
      quantities: quantities ?? this.quantities,
      dailyLimits: dailyLimits ?? this.dailyLimits,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      snackbarMessage: clearSnackbar
          ? null
          : snackbarMessage ?? this.snackbarMessage,
      snackbarType: clearSnackbar
          ? NutritionSnackbarType.none
          : snackbarType ?? this.snackbarType,
      snackbarId: snackbarId ?? this.snackbarId,
    );
  }

  List<String> get _quantityProps {
    final props =
        quantities.entries
            .map((entry) => '${entry.key}:${entry.value}')
            .toList()
          ..sort();
    return props;
  }

  @override
  List<Object?> get props => [
    status,
    fruits,
    _quantityProps,
    dailyLimits,
    errorMessage,
    snackbarMessage,
    snackbarType,
    snackbarId,
  ];
}
