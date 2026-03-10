import 'package:flutter/material.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

/// A reusable animated shimmer widget for loading states.
class AnimatedShimmer extends StatelessWidget {
  const AnimatedShimmer({
    required this.height,
    super.key,
    this.width = double.infinity,
    this.borderRadius = 12.0,
  });
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.surfaceVariant,
      highlightColor: AppColors.background,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
