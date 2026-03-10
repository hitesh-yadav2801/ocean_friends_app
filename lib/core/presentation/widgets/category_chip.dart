import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            color: isSelected ? Colors.white : AppColors.primary80,
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
