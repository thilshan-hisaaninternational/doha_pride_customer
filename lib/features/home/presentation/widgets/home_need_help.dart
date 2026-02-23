import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_icon_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeNeedHelp extends StatelessWidget {
  const HomeNeedHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: AppSpacing.screenPadding,
      vertical: AppSpacing.md,
    ),
    child: GestureDetector(
      onTap: () {
        // navigate to support or open WhatsApp
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.message_question,
            size: AppIconSizes.sm,
            color: AppColors.textSecondary,
          ),
          SizedBox(width:  AppSpacing.screenPaddingsm),
          Text(
            'Need Help? Contact Support',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: AppSpacing.screenPaddingsm),
          Icon(
            Iconsax.arrow_right_3,
            size: AppTextStyles.bodyLarge.fontSize,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    ),
  );
  }
}