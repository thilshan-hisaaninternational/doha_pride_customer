import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSpacing.lg),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.accent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.accent, width: 2),
                      gradient: LinearGradient(
                        colors: [AppColors.accent, AppColors.primary],
                      ),
                    ),
                    child: Icon(Iconsax.user, color: Colors.white, size: 28.sp),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Thilshan Mohamed',
                    style: AppTextStyles.heading3.copyWith(color: Colors.white),
                  ),
                  Text(
                    'thilshan@gmail.com',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Menu Items
            _drawerItem(Iconsax.home, 'Home', onTap: () {}),
            _drawerItem(Iconsax.ticket_2, 'My Bookings', onTap: () {}),
            _drawerItem(Iconsax.heart, 'Favourites', onTap: () {}),
            _drawerItem(Iconsax.notification, 'Notifications', onTap: () {}),
            _drawerItem(Iconsax.setting_2, 'Settings', onTap: () {}),
            _drawerItem(Iconsax.info_circle, 'About Us', onTap: () {}),

            const Spacer(),
            const Divider(),

            _drawerItem(
              Iconsax.logout,
              'Logout',
              color: AppColors.error,
              onTap: () {},
            ),
            SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
}

Widget _drawerItem(
  IconData icon,
  String label, {
  Color? color,
  VoidCallback? onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(icon, size: 22.sp, color: color ?? AppColors.textPrimary),
    title: Text(
      label,
      style: AppTextStyles.bodyLarge.copyWith(
        color: color ?? AppColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: color == null
        ? Icon(
            Iconsax.arrow_right_3,
            size: 16.sp,
            color: AppColors.textSecondary,
          )
        : null,
  );
}
