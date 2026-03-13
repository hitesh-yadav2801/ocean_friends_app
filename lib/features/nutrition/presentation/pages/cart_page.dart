import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/cubits/nutrition_tracker_cubit.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/cubits/nutrition_tracker_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NutritionTrackerCubit, NutritionTrackerState>(
      listenWhen: (previous, current) =>
          previous.snackbarId != current.snackbarId &&
          current.snackbarMessage != null,
      listener: (context, state) {
        final backgroundColor = switch (state.snackbarType) {
          NutritionSnackbarType.warning => AppColors.warning,
          NutritionSnackbarType.success => AppColors.success,
          NutritionSnackbarType.info => AppColors.primary,
          NutritionSnackbarType.none => AppColors.primary,
        };

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(state.snackbarMessage ?? ''),
              backgroundColor: backgroundColor,
              behavior: SnackBarBehavior.floating,
            ),
          );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart', style: AppTextStyles.titleLarge),
        ),
        body: SafeArea(
          child: BlocBuilder<NutritionTrackerCubit, NutritionTrackerState>(
            builder: (context, state) {
              if (state.status == NutritionTrackerStatus.loading &&
                  state.fruits.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == NutritionTrackerStatus.error) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      state.errorMessage ?? 'Failed to load cart data.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                );
              }

              if (state.cartItems.isEmpty) {
                return Center(
                  child: Text(
                    'Your cart is empty. Add items from Fruit Items page.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.gray3,
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.all(16.r),
                      itemCount: state.cartItems.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        final item = state.cartItems[index];
                        return _CartItemCard(item: item);
                      },
                    ),
                  ),
                  _TotalsCard(state: state),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                    child: ElevatedButton(
                      onPressed: () =>
                          context.read<NutritionTrackerCubit>().checkout(),
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  const _CartItemCard({required this.item});

  final CartFruitItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(14.r),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.fruit.name, style: AppTextStyles.titleMedium),
                  SizedBox(height: 4.h),
                  Text(
                    'Calories: ${_formatNumber(item.totalNutrition.calories)} kcal',
                    style: AppTextStyles.bodySmall,
                  ),
                  Text(
                    'Carbs: ${_formatNumber(item.totalNutrition.carbohydrates)} g • '
                    'Protein: ${_formatNumber(item.totalNutrition.protein)} g',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.gray4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => context
                        .read<NutritionTrackerCubit>()
                        .decrementFruit(item.fruit),
                    icon: const Icon(Icons.remove),
                  ),
                  Text('${item.quantity}', style: AppTextStyles.titleSmall),
                  IconButton(
                    onPressed: () => context
                        .read<NutritionTrackerCubit>()
                        .incrementFruit(item.fruit),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TotalsCard extends StatelessWidget {
  const _TotalsCard({required this.state});

  final NutritionTrackerState state;

  @override
  Widget build(BuildContext context) {
    final total = state.totalNutrition;
    final limits = state.dailyLimits;

    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Nutrition', style: AppTextStyles.titleMedium),
          SizedBox(height: 10.h),
          _TotalRow(
            label: 'Calories',
            current: total.calories,
            limit: limits.calories,
            unit: 'kcal',
          ),
          _TotalRow(
            label: 'Fat',
            current: total.fat,
            limit: limits.fat,
            unit: 'g',
          ),
          _TotalRow(
            label: 'Sugar',
            current: total.sugar,
            limit: limits.sugar,
            unit: 'g',
          ),
          _TotalRow(
            label: 'Carbohydrates',
            current: total.carbohydrates,
            limit: limits.carbohydrates,
            unit: 'g',
          ),
          _TotalRow(
            label: 'Protein',
            current: total.protein,
            limit: limits.protein,
            unit: 'g',
          ),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.current,
    required this.limit,
    required this.unit,
  });

  final String label;
  final double current;
  final double limit;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final isExceeded = current > limit;
    final color = isExceeded ? AppColors.error : AppColors.success;

    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(color: color),
          ),
          Text(
            '${_formatNumber(current)} / ${_formatNumber(limit)} $unit',
            style: AppTextStyles.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

String _formatNumber(double value) {
  final decimals = value % 1 == 0 ? 0 : 1;
  return value.toStringAsFixed(decimals);
}
