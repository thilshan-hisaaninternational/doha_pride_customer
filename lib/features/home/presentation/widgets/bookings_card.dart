// features/bookings/presentation/widgets/booking_card.dart
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class BookingCard extends StatelessWidget {
  final Map<String, dynamic> booking;
  final VoidCallback onTap;
  final VoidCallback? onCancel;

  const BookingCard({
    super.key,
    required this.booking,
    required this.onTap,
    this.onCancel,
  });

  // status config in one place
  Map<String, dynamic> get _statusConfig {
    switch (booking['status']) {
      case 'upcoming':
        return {
          'label': 'Upcoming',
          'color': AppColors.primary,
          'bg': AppColors.primary.withValues(alpha: 0.1),
          'icon': Iconsax.clock,
        };
      case 'completed':
        return {
          'label': 'Completed',
          'color': AppColors.success,
          'bg': AppColors.success.withValues(alpha: 0.1),
          'icon': Iconsax.tick_circle,
        };
      case 'cancelled':
        return {
          'label': 'Cancelled',
          'color': AppColors.error,
          'bg': AppColors.error.withValues(alpha: 0.1),
          'icon': Iconsax.close_circle,
        };
      default:
        return {
          'label': 'Unknown',
          'color': AppColors.textSecondary,
          'bg': AppColors.background,
          'icon': Iconsax.info_circle,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = _statusConfig;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [

            // ── Card Header ────────────────────────────────────
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  // service icon
                  Container(
                    width: 46.w,
                    height: 46.w,
                    decoration: BoxDecoration(
                      color: Color(booking['iconColor'] as int)
                          .withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      booking['icon'] as IconData,
                      size: 22.sp,
                      color: Color(booking['iconColor'] as int),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  // service name + description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking['service'],
                          style: AppTextStyles.labelLarge,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          booking['description'],
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // status badge
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: status['bg'],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          status['icon'],
                          size: 11.sp,
                          color: status['color'],
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          status['label'],
                          style: AppTextStyles.caption.copyWith(
                            color: status['color'],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Dashed Divider ─────────────────────────────────
            _DashedDivider(),

            // ── Card Details ───────────────────────────────────
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      _DetailItem(
                        icon: Iconsax.calendar_1,
                        label: 'Date',
                        value: booking['date'],
                      ),
                      _DetailItem(
                        icon: Iconsax.clock,
                        label: 'Time',
                        value: booking['time'],
                      ),
                      _DetailItem(
                        icon: Iconsax.people,
                        label: 'Guests',
                        value: '${booking['passengers']} Pax',
                      ),
                    ],
                  ),

                  SizedBox(height: AppSpacing.sm),

                  // location row
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          booking['location'],
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Card Footer ────────────────────────────────────
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18.r),
                  bottomRight: Radius.circular(18.r),
                ),
              ),
              child: Row(
                children: [
                  // booking ID
                  Row(
                    children: [
                      Icon(
                        Iconsax.ticket_2,
                        size: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        booking['id'],
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // price
                  Text(
                    booking['price'],
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  // cancel button — only for upcoming
                  if (onCancel != null) ...[
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: onCancel,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          'Cancel',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.error,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Detail Item ───────────────────────────────────────────────────────────────

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 12.sp, color: AppColors.textSecondary),
              SizedBox(width: 4.w),
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            value,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Dashed Divider ────────────────────────────────────────────────────────────

class _DashedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const dashWidth = 6.0;
          const dashSpace = 4.0;
          final count =
              (constraints.maxWidth / (dashWidth + dashSpace)).floor();
          return Row(
            children: List.generate(count, (_) {
              return Padding(
                padding: const EdgeInsets.only(right: dashSpace),
                child: Container(
                  width: dashWidth,
                  height: 1,
                  color: AppColors.divider,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}