import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';


class HomeAppBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;
  final String userName;
  final String greeting;

  const HomeAppBar({
    super.key,
    this.onMenuTap,
    this.onProfileTap,
    this.userName = 'Ahmed Al-Rashid',
    this.greeting = 'Good Morning 👋',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenPadding,
        AppSpacing.md,
        AppSpacing.screenPadding,
        AppSpacing.sm,
      ),
      child: Row(
        children: [
          // Menu / Drawer Button
          GestureDetector(
            onTap: onMenuTap,
            child: Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 8,  
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.menu, // safer fallback than Iconsax
                size: 20.sp,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          const Spacer(),

          SizedBox(width: AppSpacing.sm),

          // Profile Avatar
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
              
              ),
              child:   Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Iconsax.notification,
              size: 20.sp,
              color: AppColors.textPrimary,
            ),
          ),
            ),
          ),
        ],
      ),
    );
  }
}