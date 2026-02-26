import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Hotels-specific card for the service listing.
class HotelsServiceCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const HotelsServiceCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final String title = (item['title'] ?? '').toString();
    final String description = (item['description'] ?? '').toString();
    final String price = (item['price'] ?? '').toString();
    final String imageUrl = (item['image'] ?? '').toString();

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
        child: Row(
          children: [
            // Left: hotel image
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16.r),
              ),
              child: Image.network(
                imageUrl,
                width: 110.w,
                height: 110.h,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 110.w,
                  height: 110.h,
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Right: text content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.heading3,
                    ),
                    SizedBox(height: 4.h),

                    // Description: contains location, rating, beds, guests
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Price on the right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(), // spacer to push price to right
                        Text(
                          price,
                          style: AppTextStyles.heading3.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
