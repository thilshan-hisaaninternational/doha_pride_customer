// features/profile/presentation/widgets/profile_menu_item.dart
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Widget? trailing;       // custom trailing widget e.g toggle
  final String? trailingText;  // simple text trailing e.g 'English'
  final bool showDivider;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
    this.trailingText,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            child: Row(
              children: [
                // icon box
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    icon,
                    size: 18.sp,
                    color: AppColors.primary,
                  ),
                ),

                SizedBox(width: 14.w),

                // label
                Expanded(
                  child: Text(
                    label,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // trailing — priority: widget > text > default arrow
                if (trailing != null)
                  trailing!
                else if (trailingText != null)
                  Text(
                    trailingText!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  )
                else
                  Icon(
                    Iconsax.arrow_right_3,
                    size: 16.sp,
                    color: AppColors.textSecondary,
                  ),
              ],
            ),
          ),
        ),

        // divider between items
        if (showDivider)
          Divider(
            height: 1,
            indent: 16.w + 36.w + 14.w, // aligns with text, not icon
            endIndent: 0,
            color: AppColors.divider,
          ),
      ],
    );
  }
}