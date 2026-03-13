import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/nutrition_values.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/cubits/nutrition_tracker_cubit.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/cubits/nutrition_tracker_state.dart';

class DailyNutritionRequirementsPage extends StatefulWidget {
  const DailyNutritionRequirementsPage({super.key});

  @override
  State<DailyNutritionRequirementsPage> createState() =>
      _DailyNutritionRequirementsPageState();
}

class _DailyNutritionRequirementsPageState
    extends State<DailyNutritionRequirementsPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _caloriesController;
  late final TextEditingController _fatController;
  late final TextEditingController _sugarController;
  late final TextEditingController _carbohydratesController;
  late final TextEditingController _proteinController;

  @override
  void initState() {
    super.initState();
    final limits = context.read<NutritionTrackerCubit>().state.dailyLimits;
    _caloriesController = TextEditingController(
      text: _formatFieldValue(limits.calories),
    );
    _fatController = TextEditingController(text: _formatFieldValue(limits.fat));
    _sugarController = TextEditingController(
      text: _formatFieldValue(limits.sugar),
    );
    _carbohydratesController = TextEditingController(
      text: _formatFieldValue(limits.carbohydrates),
    );
    _proteinController = TextEditingController(
      text: _formatFieldValue(limits.protein),
    );
  }

  @override
  void dispose() {
    _caloriesController.dispose();
    _fatController.dispose();
    _sugarController.dispose();
    _carbohydratesController.dispose();
    _proteinController.dispose();
    super.dispose();
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
            'Daily Nutrition Limits',
            style: AppTextStyles.titleLarge,
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(20.r),
              children: [
                Text(
                  'Set your per-day nutrition goals. Defaults are pre-filled and can be changed anytime.',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
                SizedBox(height: 20.h),
                _buildField(
                  controller: _caloriesController,
                  label: 'Calories',
                  unit: 'kcal',
                ),
                _buildField(
                  controller: _fatController,
                  label: 'Fat',
                  unit: 'g',
                ),
                _buildField(
                  controller: _sugarController,
                  label: 'Sugar',
                  unit: 'g',
                ),
                _buildField(
                  controller: _carbohydratesController,
                  label: 'Carbohydrates',
                  unit: 'g',
                ),
                _buildField(
                  controller: _proteinController,
                  label: 'Protein',
                  unit: 'g',
                ),
                SizedBox(height: 18.h),
                OutlinedButton(
                  onPressed: _restoreDefaults,
                  child: const Text('Restore Defaults'),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: _saveLimits,
                  child: const Text('Save Limits'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String unit,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: '$label ($unit)',
        ),
        validator: (value) {
          final parsed = double.tryParse((value ?? '').trim());
          if (parsed == null) {
            return 'Please enter a valid number';
          }
          if (parsed < 0) {
            return 'Value cannot be negative';
          }
          return null;
        },
      ),
    );
  }

  void _restoreDefaults() {
    _setFields(NutritionValues.defaultDailyLimits);
  }

  void _setFields(NutritionValues values) {
    _caloriesController.text = _formatFieldValue(values.calories);
    _fatController.text = _formatFieldValue(values.fat);
    _sugarController.text = _formatFieldValue(values.sugar);
    _carbohydratesController.text = _formatFieldValue(values.carbohydrates);
    _proteinController.text = _formatFieldValue(values.protein);
  }

  void _saveLimits() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final limits = NutritionValues(
      calories: double.parse(_caloriesController.text.trim()),
      fat: double.parse(_fatController.text.trim()),
      sugar: double.parse(_sugarController.text.trim()),
      carbohydrates: double.parse(_carbohydratesController.text.trim()),
      protein: double.parse(_proteinController.text.trim()),
    );

    context.read<NutritionTrackerCubit>().saveDailyLimits(limits);
  }
}

String _formatFieldValue(double value) {
  final decimals = value % 1 == 0 ? 0 : 1;
  return value.toStringAsFixed(decimals);
}
