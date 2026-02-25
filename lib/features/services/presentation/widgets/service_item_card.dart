import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ServiceItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const ServiceItemCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // ✅ Structured badges, safe default
    final List<dynamic> badges = (item['badges'] as List<dynamic>?) ?? [];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔶 Image with Bottom-Overlapping Badge
            SizedBox(
              height: 190.h, // a bit taller to allow overlap
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          item['image'],
                          height: 170.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            height: 170.h,
                            color: AppColors.primary.withValues(alpha: 0.1),
                            child: Icon(
                              item['icon'],
                              size: 40.sp,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        // 🔥 Bottom Gradient (for readability)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.6),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 🔖 Badge (0–2 segments) half on image, half below
                  if (badges.isNotEmpty)
                    Positioned(
                      bottom: 6.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 60.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: item['badgeColor'] != null
                                ? Color(item['badgeColor'])
                                : AppColors.secondary,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _BadgeSegment(
                                badge: badges[0] as Map<String, dynamic>,
                              ),
                              if (badges.length > 1) ...[
                                SizedBox(width: 12.w),
                                _BadgeSegment(
                                  badge: badges[1] as Map<String, dynamic>,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(item['title'], style: AppTextStyles.heading3),

                  SizedBox(height: 6.h),

                  // Description (max 2 lines)
                  Text(
                    item['description'],
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 12.h),

                  // Price + Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['duration'],
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            item['price'],
                            style: AppTextStyles.heading3.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                      Icon(Iconsax.arrow_right_3, color: AppColors.primary),
                    ],
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

class _BadgeSegment extends StatelessWidget {
  final Map<String, dynamic> badge;

  const _BadgeSegment({required this.badge});

  @override
  Widget build(BuildContext context) {
    final IconData? icon = badge['icon'] as IconData?;
    final String label = (badge['label'] ?? '') as String;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: 14.sp,
            color: Colors.white,
          ),
          SizedBox(width: 4.w),
        ],
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}