import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelsServiceCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const HotelsServiceCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final String title = (item['title'] ?? '').toString();
    final String location = (item['location'] ?? '').toString();
    final String price = (item['price'] ?? '').toString();
    final String imageUrl = (item['image'] ?? '').toString();
    final double rating = (item['rating'] as num?)?.toDouble() ?? 0.0;
    final int beds = (item['beds'] as num?)?.toInt() ?? 0;
    final int guests = (item['guests'] as num?)?.toInt() ?? 0;

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
        child: SizedBox(
          height: 190.h,
          child: Stack(
            children: [
              // Background image
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  imageUrl,
                  height: 190.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 190.h,
                    color: AppColors.primary.withValues(alpha: 0.1),
                  ),
                ),
              ),

              // Top-left: title + location + arrow
              Positioned(
                top: 12.h,
                left: 12.w,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left: title + location
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Text(
                                    location,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.caption.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      // Right: small circular arrow
                      Container(
                        width: 28.w,
                        height: 28.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom: price, rating, beds, guests (in that order)
              Positioned(
                left: 12.w,
                right: 12.w,
                bottom: 12.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _specBadge(label: price.isNotEmpty ? price : '-'),
                    _specBadge(
                      icon: Icons.star,
                      label: rating > 0 ? rating.toStringAsFixed(1) : '-',
                    ),
                    _specBadge(
                      icon: Icons.bed_outlined,
                      label: beds > 0 ? '$beds bed' : '-',
                    ),
                    _specBadge(
                      icon: Icons.person_outline,
                      label: guests > 0 ? '$guests guests' : '-',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _specBadge({IconData? icon, required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12.sp, color: Colors.white),
            SizedBox(width: 4.w),
          ],
          Text(
            label,
            style: AppTextStyles.caption.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
