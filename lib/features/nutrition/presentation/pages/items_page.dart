import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ocean_friends_app/core/router/route_names.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/fruit.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/cubits/nutrition_tracker_cubit.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/cubits/nutrition_tracker_state.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<NutritionTrackerCubit>();
    if (cubit.state.status == NutritionTrackerStatus.initial) {
      cubit.loadFruits();
    }
  }

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
          title: Text(
            'Fruit Items',
            style: AppTextStyles.titleLarge,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.tune),
              tooltip: 'Daily limits',
              onPressed: () => context.pushNamed(RouteNames.dailyNutritionName),
            ),
            BlocBuilder<NutritionTrackerCubit, NutritionTrackerState>(
              buildWhen: (previous, current) =>
                  previous.totalItemCount != current.totalItemCount,
              builder: (context, state) {
                return _CartIconButton(
                  itemCount: state.totalItemCount,
                  onTap: () => context.pushNamed(RouteNames.cartName),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<NutritionTrackerCubit, NutritionTrackerState>(
          builder: (context, state) {
            if (state.status == NutritionTrackerStatus.loading &&
                state.fruits.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == NutritionTrackerStatus.error) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.errorMessage ?? 'Failed to load fruits.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<NutritionTrackerCubit>().loadFruits(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state.fruits.isEmpty) {
              return Center(
                child: Text(
                  'No fruits available right now.',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () =>
                  context.read<NutritionTrackerCubit>().loadFruits(),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                children: [
                  _CartSummaryCard(state: state),
                  SizedBox(height: 16.h),
                  ...state.fruits.map(
                    (fruit) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: _FruitCard(
                        fruit: fruit,
                        quantity: state.quantities[fruit.id] ?? 0,
                        onIncrement: () => context
                            .read<NutritionTrackerCubit>()
                            .incrementFruit(fruit),
                        onDecrement: () => context
                            .read<NutritionTrackerCubit>()
                            .decrementFruit(fruit),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CartSummaryCard extends StatelessWidget {
  const _CartSummaryCard({required this.state});

  final NutritionTrackerState state;

  @override
  Widget build(BuildContext context) {
    final total = state.totalNutrition;

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cart Snapshot (${state.totalItemCount} items)',
            style: AppTextStyles.titleMedium,
          ),
          SizedBox(height: 8.h),
          Text(
            'Calories ${_formatNumber(total.calories)} kcal  •  '
            'Fat ${_formatNumber(total.fat)} g  •  '
            'Sugar ${_formatNumber(total.sugar)} g',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.labelColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Carbs ${_formatNumber(total.carbohydrates)} g  •  '
            'Protein ${_formatNumber(total.protein)} g',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.labelColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _FruitCard extends StatelessWidget {
  const _FruitCard({
    required this.fruit,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final Fruit fruit;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fruit.name,
              style: AppTextStyles.titleMedium,
            ),
            SizedBox(height: 4.h),
            Text(
              '${fruit.family} • ${fruit.order} • ${fruit.genus}',
              style: AppTextStyles.bodySmall,
            ),
            SizedBox(height: 10.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                _MetricChip(
                  label: 'Calories',
                  value: '${_formatNumber(fruit.nutrition.calories)} kcal',
                ),
                _MetricChip(
                  label: 'Fat',
                  value: '${_formatNumber(fruit.nutrition.fat)} g',
                ),
                _MetricChip(
                  label: 'Sugar',
                  value: '${_formatNumber(fruit.nutrition.sugar)} g',
                ),
                _MetricChip(
                  label: 'Carbs',
                  value: '${_formatNumber(fruit.nutrition.carbohydrates)} g',
                ),
                _MetricChip(
                  label: 'Protein',
                  value: '${_formatNumber(fruit.nutrition.protein)} g',
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerRight,
              child: quantity == 0
                  ? ElevatedButton(
                      onPressed: onIncrement,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(90.w, 38.h),
                      ),
                      child: const Text('Add'),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.gray4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: onDecrement,
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            '$quantity',
                            style: AppTextStyles.titleSmall,
                          ),
                          IconButton(
                            onPressed: onIncrement,
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Text(
        '$label: $value',
        style: AppTextStyles.labelSmall.copyWith(color: AppColors.labelColor),
      ),
    );
  }
}

class _CartIconButton extends StatelessWidget {
  const _CartIconButton({required this.itemCount, required this.onTap});

  final int itemCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: onTap,
          icon: const Icon(Icons.shopping_cart_outlined),
          tooltip: 'Cart',
        ),
        if (itemCount > 0)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              width: 18.r,
              height: 18.r,
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '$itemCount',
                style: AppTextStyles.labelSmall.copyWith(
                  color: Colors.white,
                  fontSize: 9.sp,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

String _formatNumber(double value) {
  final decimals = value % 1 == 0 ? 0 : 1;
  return value.toStringAsFixed(decimals);
}
