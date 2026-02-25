import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatsRow extends StatelessWidget {
  final int totalBookings;
  final int completedTrips;
  final int loyaltyPoints;

  const ProfileStatsRow({
    super.key,
    required this.totalBookings,
    required this.completedTrips,
    required this.loyaltyPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatBox(
          label: 'Total\nBookings',
          value: '$totalBookings',
          color: AppColors.primary,
        ),
        SizedBox(width: 12.w),
        _StatBox(
          label: 'Completed\nTrips',
          value: '$completedTrips',
          color: AppColors.success,
        ),
        SizedBox(width: 12.w),
        _StatBox(
          label: 'Loyalty\nPoints',
          value: '$loyaltyPoints',
          color: AppColors.accent,
        ),
      ],
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatBox({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Simple circular indicator using the color
            Container(
              width: 26.w,
              height: 26.w,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Container(
                width: 14.w,
                height: 14.w,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              value,
              style: AppTextStyles.heading2.copyWith(color: color),
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

