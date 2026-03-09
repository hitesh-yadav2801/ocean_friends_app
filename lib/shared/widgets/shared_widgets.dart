import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';

/// A skeleton shimmer card rendered while content is loading.
///

/// Pair with [shimmer] package for the animated shine effect.
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 16,
  });

  /// Card height — defaults to 200.h if not specified.
  final double? height;

  /// Card width — defaults to full width if not specified.
  final double? width;

  /// Corner radius of the shimmer skeleton.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
    );
  }
}

/// An error state widget shown when a data fetch fails.
///
/// Displays a message and a retry button. Pass [onRetry] to handle the tap.
class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.message, super.key,
    this.onRetry,
  });

  /// The error message to display to the user.
  final String message;

  /// Optional callback invoked when the user taps "Try again".
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 56.r,
              color: AppColors.gray4,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.gray3,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 24.h),
              OutlinedButton(
                onPressed: onRetry,
                child: const Text('Try again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// An empty state widget shown when a search or filter returns no results.
class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    this.title = 'No results found',
    this.subtitle = 'Try a different search term or category.',
    this.icon = Icons.search_off_rounded,
  });

  /// Primary heading of the empty state.
  final String title;

  /// Supporting text below the heading.
  final String subtitle;

  /// Icon rendered above the text.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64.r, color: AppColors.gray4),
            SizedBox(height: 16.h),
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.gray3,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              subtitle,
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
