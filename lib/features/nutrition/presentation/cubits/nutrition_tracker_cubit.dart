import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/usecase/usecase.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/fruit.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/nutrition_values.dart';
import 'package:ocean_friends_app/features/nutrition/domain/use_cases/get_all_fruits_usecase.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/cubits/nutrition_tracker_state.dart';

@injectable
class NutritionTrackerCubit extends Cubit<NutritionTrackerState> {
  NutritionTrackerCubit(this._getAllFruitsUseCase)
    : super(NutritionTrackerState.initial());

  final GetAllFruitsUseCase _getAllFruitsUseCase;

  Future<void> loadFruits() async {
    if (state.status == NutritionTrackerStatus.loading) {
      return;
    }

    emit(
      state.copyWith(
        status: NutritionTrackerStatus.loading,
        clearError: true,
      ),
    );

    final result = await _getAllFruitsUseCase(NoParams());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: NutritionTrackerStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (fruits) {
        emit(
          state.copyWith(
            status: NutritionTrackerStatus.loaded,
            fruits: fruits,
            quantities: _retainOnlyAvailableFruitQuantities(fruits),
            clearError: true,
          ),
        );
      },
    );
  }

  void incrementFruit(Fruit fruit) {
    final currentQuantity = state.quantities[fruit.id] ?? 0;
    _updateFruitQuantity(fruit, currentQuantity + 1);
  }

  void decrementFruit(Fruit fruit) {
    final currentQuantity = state.quantities[fruit.id] ?? 0;
    _updateFruitQuantity(fruit, currentQuantity - 1);
  }

  void updateFruitQuantity(Fruit fruit, int quantity) {
    _updateFruitQuantity(fruit, quantity);
  }

  void saveDailyLimits(NutritionValues limits) {
    final warningMessage = _buildExceededMessage(
      quantities: state.quantities,
      limits: limits,
    );

    emit(
      state.copyWith(
        dailyLimits: limits,
        snackbarMessage:
            warningMessage ?? 'Daily nutrition limits saved successfully.',
        snackbarType: warningMessage == null
            ? NutritionSnackbarType.success
            : NutritionSnackbarType.warning,
        snackbarId: state.snackbarId + 1,
      ),
    );
  }

  void checkout() {
    if (state.totalItemCount == 0) {
      emit(
        state.copyWith(
          snackbarMessage: 'Your cart is empty.',
          snackbarType: NutritionSnackbarType.info,
          snackbarId: state.snackbarId + 1,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        quantities: {},
        snackbarMessage: 'Checkout successful! Enjoy your fruits.',
        snackbarType: NutritionSnackbarType.success,
        snackbarId: state.snackbarId + 1,
      ),
    );
  }

  void _updateFruitQuantity(Fruit fruit, int quantity) {
    final safeQuantity = quantity < 0 ? 0 : quantity;
    final updatedQuantities = Map<int, int>.from(state.quantities);

    if (safeQuantity == 0) {
      updatedQuantities.remove(fruit.id);
    } else {
      updatedQuantities[fruit.id] = safeQuantity;
    }

    final warningMessage = _buildExceededMessage(
      quantities: updatedQuantities,
      limits: state.dailyLimits,
    );

    if (warningMessage == null) {
      emit(
        state.copyWith(
          quantities: updatedQuantities,
          clearSnackbar: true,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        quantities: updatedQuantities,
        snackbarMessage: warningMessage,
        snackbarType: NutritionSnackbarType.warning,
        snackbarId: state.snackbarId + 1,
      ),
    );
  }

  String? _buildExceededMessage({
    required Map<int, int> quantities,
    required NutritionValues limits,
  }) {
    final total = _calculateTotalNutrition(quantities);
    final exceeded = total.exceededNutrients(limits);

    if (exceeded.isEmpty) {
      return null;
    }

    return 'You are exceeding ${exceeded.join(', ')}. '
        'Please reduce quantities or choose lower-nutrition options.';
  }

  NutritionValues _calculateTotalNutrition(Map<int, int> quantities) {
    var total = NutritionValues.zero;
    for (final fruit in state.fruits) {
      final quantity = quantities[fruit.id] ?? 0;
      if (quantity > 0) {
        total += fruit.nutrition.multiply(quantity);
      }
    }

    return total;
  }

  Map<int, int> _retainOnlyAvailableFruitQuantities(List<Fruit> fruits) {
    final availableIds = fruits.map((fruit) => fruit.id).toSet();
    return Map<int, int>.fromEntries(
      state.quantities.entries.where(
        (entry) => availableIds.contains(entry.key),
      ),
    );
  }
}
